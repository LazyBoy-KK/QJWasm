use std::any::Any;

use rquickjs::{Persistent, SendSyncJsValue, ThreadCtx, Value};
use runtime::Val;

use crate::wasm::{Function, Instance, RuntimeError};
use crate::object_impl::{utils::{map_js_to_wasm, map_wasm_to_js, clone_error}, store::StateData};

struct FuncWrapper {
    func_ref: runtime::VMFuncRef,
    params: Vec<Val>,
    results: Vec<Val>
}

// ptr will only be accessed in rust thread
unsafe impl Send for FuncWrapper {}
unsafe impl Sync for FuncWrapper {}

impl FuncWrapper {
    fn call(&mut self) -> runtime::Result<()> {
        unsafe {
            self.func_ref.call(&self.params, &mut self.results)
        }
    }
}

// Type A, R is useless here
impl<'js, A, R> rquickjs::AsFunction<'js, A, R> for Function {
    fn num_args() -> std::ops::Range<usize> {
        // See the macro in wasmtime::Func
        0..16
    }

    fn call(&self, input: &rquickjs::Input<'js>) -> rquickjs::Result<rquickjs::Value<'js>> {
        use runtime::ValType;

        let ty = unsafe { self.inner.ty() };
        let wasm_params_ty = ty.params();
        let wasm_results_ty = ty.results();
        if wasm_params_ty.len() != input.len() {
            return Err(rquickjs::Error::NumArgs {
                expected: wasm_params_ty.len()..wasm_params_ty.len(),
                given: input.len(),
            });
        }
        let mut wasm_params = Vec::new();
        let mut wasm_results = Vec::new();
        let mut input = input.access();
        let ctx = input.ctx();
		let persist_instance = self.instance_ref.get_value().unwrap();
        let ins_val = persist_instance.clone().restore(ctx)?;
        let instance = <&mut Instance as rquickjs::FromJs>::from_js(ctx, ins_val)?;
        for param in wasm_params_ty {
            let val = match param {
                ValType::I32 => {
					let value = input.arg::<rquickjs::Value>()?;
					map_js_to_wasm(
						ctx, 
						value, 
						runtime::ValType::I32, 
						true, 
						false, 
						None
					)?
				}
                ValType::I64 => {
                    let value = input.arg::<rquickjs::Value>()?;
                    map_js_to_wasm(
						ctx, 
						value, 
						runtime::ValType::I64, 
						false, 
						false, 
						None
					)?
                }
                ValType::F32 => Val::F32(input.arg::<f32>()?),
                ValType::F64 => Val::F64(input.arg::<f64>()?),
                ValType::Ref(runtime::RefType::FUNCREF) => {
					let value = input.arg::<rquickjs::Value>()?;
					if value.is_null() {
						Val::FuncRef(None)
					} else {
						map_js_to_wasm(
							ctx, 
							value, 
							runtime::ValType::I64, 
							false, 
							false, 
							Some(instance.state.get_mut_state().instanceref_cap())
						)?
					}
				}
                ValType::Ref(runtime::RefType::EXTERNREF) => {
					let value = input.arg::<rquickjs::Value>()?;
					if value.is_null() {
						Val::ExternRef(None)
					} else {
						map_js_to_wasm(
							ctx, 
							value, 
							runtime::ValType::I64, 
							false, 
							false, 
							Some(instance.state.get_mut_state().externref_cap())
						)?
					}
				}
                _ => todo!(),
            };
            wasm_params.push(val)
        }
        for result in wasm_results_ty {
            let val = match result {
                ValType::I32 => Val::I32(Default::default()),
                ValType::I64 => Val::I64(Default::default()),
                ValType::F32 => Val::F32(Default::default()),
                ValType::F64 => Val::F64(Default::default()),
                ValType::Ref(runtime::RefType::FUNCREF) => Val::FuncRef(Default::default()),
                ValType::Ref(runtime::RefType::EXTERNREF) => Val::ExternRef(None),
                _ => unreachable!(),
            };
            wasm_results.push(val)
        }

        instance.state.get_mut_state().inc_ctx_ref(ctx)?;
        let wrapper = FuncWrapper {
            func_ref: self.inner.clone(),
            params: wasm_params,
            results: wasm_results
        };

        if !self.is_async {
            sync_call(ctx, instance, wrapper)
        } else {
			if instance.thread_ctx.is_none() {
				instance.thread_ctx = Some(ThreadCtx::new(ctx));
			}
			let thread_ctx = instance.thread_ctx.as_ref().unwrap();
            async_call(ctx, instance.state.clone(), persist_instance, wrapper, thread_ctx)
        }
    }
}

fn sync_call<'js>(
    ctx: rquickjs::Ctx<'js>,
	instance: &mut Instance,
    mut wrapper: FuncWrapper,
) -> rquickjs::Result<rquickjs::Value<'js>> {
    use rquickjs::IntoJs;
	let state = instance.state.clone();
    defer_lite::defer! {
        state.get_mut_state().dec_ctx_ref().unwrap();
    }
    let res = wrapper.call();
    handle_err(res)?;
    let wasm_results = &mut wrapper.results;
	#[cfg(feature = "rust-allocator")]
	instance.update_memory_after_call();
	#[cfg(all(feature = "quickjs-libc", not(feature = "rust-allocator")))]
	// 调用函数后线性内存可能变化，此时不会重新计算堆内存，需手动修改
	ctx.inc_malloc_size(instance.update_memory_after_call());
    match wasm_results.len() {
        0 => Ok(rquickjs::Value::new_undefined(ctx)),
        1 => {
            let value = map_wasm_to_js(
                ctx,
                &wasm_results.pop().unwrap(),
            )?;
            Ok(value)
        }
        _ => {
            let ret: Vec<rquickjs::Value> = wasm_results
                .into_iter()
                .map(|v| map_wasm_to_js(ctx, &v))
                .try_collect()?;
            Ok(ret.into_js(ctx)?)
        }
    }
}

fn async_call<'js>(
    ctx: rquickjs::Ctx<'js>,
    state: StateData,
	instance_ref: Persistent<Value<'static>>,
    mut wrapper: FuncWrapper,
	thread_ctx: &ThreadCtx,
) -> rquickjs::Result<rquickjs::Value<'js>> {
    use rquickjs::IntoJs;

    let (promise, resolve, reject) = ctx.promise()?;
    let resolve = SendSyncJsValue::new(ctx, resolve.into_value());
    let reject = SendSyncJsValue::new(ctx, reject.into_value());
	let instance_ref = SendSyncJsValue::from_persist(instance_ref);
    let context = rquickjs::SendSyncContext::new(rquickjs::Context::from_ctx(ctx)?);
    
    thread_ctx.spawn_wasm_task(ctx, context, Some(Box::new(move || {
        let res = wrapper.call();
        handle_err(res)?;
        Ok(Box::new(wrapper))
    })), 
    move |wasm_ctx, res| {
        match res {
            Some(Ok(res)) => {
                let mut wrapper = res.downcast::<FuncWrapper>().unwrap();
                wasm_ctx.spawn_js_task(Some(Box::new(move |js_ctx| {
                    defer_lite::defer! {
                        state.get_mut_state().dec_ctx_ref().unwrap();
                    }
                    let wasm_results = &mut wrapper.results;
                    let context = js_ctx.ctx();
                    context.with(|ctx| {
						let instance = instance_ref.into_inner(ctx)?;
						let instance = <&mut Instance as rquickjs::FromJs>::from_js(ctx, instance)?;
						#[cfg(feature = "rust-allocator")]
						instance.update_memory_after_call();
						#[cfg(all(feature = "quickjs-libc", not(feature = "rust-allocator")))]
						ctx.inc_malloc_size(instance.update_memory_after_call());
                        match wasm_results.len() {
                            0 => Ok::<_, rquickjs::Error>(Box::new(rquickjs::Persistent::save(
                                ctx,
                                rquickjs::Value::new_undefined(ctx),
                            )) as Box<dyn Any>),
                            1 => {
                                let value = map_wasm_to_js(
                                    ctx,
                                    &wasm_results.pop().unwrap(),
                                )?;
                                Ok(Box::new(rquickjs::Persistent::save(ctx, value)) as Box<dyn Any>)
                            }
                            _ => {
                                let ret: Vec<rquickjs::Value> = wasm_results
                                    .into_iter()
                                    .map(|v| map_wasm_to_js(ctx, &v))
                                    .try_collect()?;
                                Ok(Box::new(rquickjs::Persistent::save(ctx, ret.into_js(ctx)?)) as Box<dyn Any>)
                            }
                        }
                    })
                })),
                |js_ctx, res| {
                    match res {
                        Some(Ok(res)) => js_ctx.resolve(res.downcast::<Persistent<Value>>().unwrap()),
                        Some(Err(err)) => js_ctx.reject(err),
                        _ => unreachable!()
                    }
                });
            }
            Some(Err(err)) => wasm_ctx.reject_with_clocure(err, Box::new(move || state.get_mut_state().dec_ctx_ref().unwrap())),
            _ => unreachable!()
        }
    },
    resolve, reject, true);
    promise.into_js(ctx)
}

fn handle_err(res: std::result::Result<(), Box<runtime::Error>>) -> rquickjs::Result<()> {
    if let Err(e) = res {
        if let runtime::Error::Custom { error } = e.as_ref() {
            if let Some(js_err) = error.downcast_ref::<rquickjs::Error>() {
                if let Some(e) = clone_error(js_err) {
                    return Err(e);
                }
            }
        }
        return Err(rquickjs::Error::new_custom_error::<RuntimeError>(
            "RuntimeError".to_string(),
            format!("{e:?}"),
        ));
    }
    Ok(())
}

impl rquickjs::HasRefs for Function {
    fn mark_refs(&self, marker: &rquickjs::RefsMarker) {
        self.instance_ref.mark_refs(marker);
    }
}

impl rquickjs::DeepSizeOf for Function {}
