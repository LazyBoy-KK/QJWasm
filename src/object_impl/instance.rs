use crate::{
    object_impl::{
        global::ConstGlobal,
        memory::MemoryRefManager,
        store::{State, StateData},
        utils::{map_js_to_wasm, SavedValue},
    },
    wasm::{Function, Global, Instance, LinkError, Memory, Module, Table}, RefCapture, INSTANCE_REF_MAP
};
use rquickjs::{DeepSizeCtx, Error, JsMessageCtx, Object, Persistent, Result, ThreadCtx, Value, WasmMessageCtx};
use runtime::{
    panic_any, ExternType, ImportType, InstanceHandle, InstanceInner, VMArrayCall, VMArrayCallContext, VMContext, VMFuncRef, VMGlobal, VMGlobalInstance, ValRaw
};
use std::{cell::UnsafeCell, mem::ManuallyDrop, ptr::NonNull, sync::Arc};

use super::{global::MutGlobal, store::ArrayCallInfo};

pub const WASM_PAGE: usize = 65536;

// Safety: js references of these objects are kept by State
pub enum Extern {
    // import type index for trampoline
    Func(u32),
    Memory(&'static Memory),
    Global(&'static Global),
    Table(&'static Table),
}

pub struct ExternWrapper {
    index: u32,
    inner: Extern,
}

pub struct InstanceWrapper {
	handle: InstanceHandle,
	pub(crate) cur_mem: usize,
}

#[cfg(feature = "rust-allocator")]
impl InstanceWrapper {
	pub fn update_memory_before_drop(&self) {
		rquickjs::memory_size_dec(InstanceInner::vmctx_layout(self.handle.as_ref().offsets()).size() + self.cur_mem * WASM_PAGE);
	}
}

impl Drop for InstanceWrapper {
    fn drop(&mut self) {
        unsafe {
			#[cfg(feature = "rust-allocator")]
			self.update_memory_before_drop();
            let inner = self.handle.as_mut();
            inner.drop_manually();
            InstanceInner::dealloc(inner);
        }
    }
}

impl rquickjs::DeepSizeOf for InstanceWrapper {
	fn deep_size_of_children(&self, context: &mut DeepSizeCtx) -> usize {
		let sum = InstanceInner::vmctx_layout(self.handle.as_ref().offsets()).size() + 
			self.cur_mem * WASM_PAGE +
				self.handle.exports.len() * size_of::<runtime::Extern>() +
					self.handle.imports.len() * size_of::<Option<runtime::Extern>>();
		let host_state_mem = if let Some(info) = self.handle.as_ref().host_state::<InstanceInfo>() {
			info.deep_size_of_children(context)
		} else {
			0
		};
		host_state_mem + sum
	}
}

#[derive(Clone)]
pub struct InstanceCount(Arc<UnsafeCell<InstanceWrapper>>);

impl InstanceCount {
	pub fn get_instance_inner(&self) -> &mut InstanceInner {
		unsafe { &mut *self.0.get() }.handle.as_mut()
	}

	pub fn get_wrapper(&self) -> &mut InstanceWrapper {
		unsafe { &mut *self.0.get() }
	}
}

impl rquickjs::DeepSizeOf for InstanceCount {
	fn deep_size_of_children(&self, context: &mut DeepSizeCtx) -> usize {
		let sum = (*self.get_wrapper()).deep_size_of_children(context);
		sum
	}
}

pub struct InstanceInfo {
    instance_handle: InstanceWrapper,
    state: StateData,
    extern_vec: Vec<ExternWrapper>,
}

// only be accessed in rust thread
unsafe impl Send for InstanceInfo {}

impl rquickjs::DeepSizeOf for InstanceInfo {
	fn deep_size_of_children(&self, _context: &mut DeepSizeCtx) -> usize {
		self.extern_vec.len() * size_of::<ExternWrapper>()
	}
}

unsafe impl Send for Instance {}

impl rquickjs::DeepSizeOf for Instance {
	fn deep_size_of_children(&self, context: &mut DeepSizeCtx) -> usize {
		let sum = self.inner.deep_size_of_children(context) +
			self.state.deep_size_of_children(context);
		sum
	}
}

unsafe extern "C-unwind" fn array_call_trampoline<F>(
    func: *mut VMArrayCallContext,
    params: *mut ValRaw,
) where
    F: Fn(*mut VMContext, *mut ValRaw) -> runtime::Result<()> + Send + Sync + 'static,
{
    let func = VMArrayCall::from_vmctx(func).as_ref().unwrap();
    let array_call: &F = func.array_call.downcast_ref().unwrap();
    let vmctx = func.ctx.vmctx;
    if let Err(e) = array_call(vmctx, params) {
        panic_any(e)
    }
}

impl Instance {
    pub fn new_pre<'js>(
        ctx: rquickjs::Ctx<'js>,
        module: &Module,
        import_object: Option<Value<'js>>,
    ) -> Result<InstanceInfo> {
        let import_object = match import_object {
            Some(v) => {
                if v.is_undefined() {
                    None
                } else {
                    Some(
                        v.into_object()
                            .ok_or_else(|| rquickjs::Error::new_from_js("Value", "Object"))?,
                    )
                }
            }
            None => None,
        };
        let mut state = State::new();

        let raw_instance = InstanceInner::new(module.get_module().clone());
        let handle = InstanceWrapper {
			handle: InstanceHandle {
				instance: runtime::SendSyncPtr::new(raw_instance),
				imports: Vec::new(),
				exports: Vec::new(),
			},
			cur_mem: 0
		};
        let extern_vec = Self::add_import(ctx, &mut state, &module, import_object)?;
        Ok(InstanceInfo {
            instance_handle: handle,
            state: StateData::new(state),
            extern_vec,
        })
    }

    fn import_array_call_func<F>(
        boxed_array_call: Box<F>,
        state: StateData,
        raw_instance: &mut InstanceInner,
        func_idx: u32,
    ) where
        F: Fn(*mut VMContext, *mut ValRaw) -> runtime::Result<()> + Send + Sync + 'static,
    {
        let module = raw_instance.module().clone();
        let array_call_ctx = VMArrayCallContext {
            trampoline: NonNull::new(array_call_trampoline::<F> as *mut _).unwrap(),
            vmctx: raw_instance.vmctx(),
        };
        let array_call = VMArrayCall::new(
            unsafe { std::mem::transmute(boxed_array_call.as_ref() as &dyn std::any::Any) },
            array_call_ctx,
        );
        let array_call_vmctx = array_call.into_vmctx();
        let imp_func = &module.offsets().import_funcs[func_idx as usize];
        let trampoline = module.metadata().trampoline.w2a[imp_func.type_index as usize].unwrap();
        let func_ref = VMFuncRef {
            native_call: trampoline.as_ptr(),
            vmctx: array_call_vmctx,
            type_index: imp_func.type_index,
			offset: imp_func.offset,
            caller: raw_instance.vmctx(),
        };
        unsafe {
            raw_instance.init_import_func(imp_func, func_ref);
        }
        state
            .get_mut_state()
            .get_wasm_array_calls_mut()
            .push(ArrayCallInfo {
                array_call: boxed_array_call,
                vmctx: array_call_vmctx,
            });
    }

    pub fn new_post(mut info: InstanceInfo, thread_ctx: Option<ThreadCtx>) -> Result<Self> {
        let mut raw_instance = info.instance_handle.handle.as_mut();
        raw_instance.set_host_state(Box::new(info.state.clone()));
        for ext in info.extern_vec {
            match ext.inner {
                Extern::Func(func_idx) => {
                    let boxed_array_call = Box::new(
                        move |vmctx: *mut VMContext, params: *mut ValRaw| -> runtime::Result<()> {
                            unsafe {
                                InstanceInner::from_vmctx(vmctx, |inner| {
                                    let state: &StateData = inner.host_state().unwrap();
                                    state.call_func(func_idx, params)
                                })
                            }
                        },
                    );
                    Self::import_array_call_func(
                        boxed_array_call,
                        info.state.clone(),
                        &mut raw_instance,
                        func_idx,
                    );
                }
                Extern::Global(g) => {
                    let ty =
                        match raw_instance.module().offsets().globals[ext.index as usize].clone() {
                            runtime::VMGlobal::Mut(g) => g,
                            runtime::VMGlobal::Const(_) => unreachable!(),
                        };
                    let g = match g {
                        Global::Mut(g) => g.get_inner_mut(),
                        Global::Const(g) => &g.inner,
                    };
                    unsafe { raw_instance.init_import_global(&ty, g) }
                }
                Extern::Memory(m) => {
                    let ty = raw_instance
                        .module()
                        .offsets()
                        .memory
                        .as_ref()
                        .unwrap()
                        .clone();
                    unsafe { raw_instance.init_import_memory(&ty, &m.convert_to_import()) }
                }
                Extern::Table(t) => {
                    let ty = raw_instance.module().offsets().tables[ext.index as usize].clone();
                    let t = match &t.inner.raw {
                        runtime::VMRawTableInstance::FuncRefIndirect(t) => t,
                        _ => unreachable!(),
                    };
                    unsafe { raw_instance.init_import_table(&ty, t) }
                }
            }
        }
        unsafe {
            if let Err(e) = raw_instance.init_vmctx() {
                raw_instance.drop_manually();
                InstanceInner::dealloc(raw_instance);
                return Err(rquickjs::Error::new_custom_error::<LinkError>(
                    "LinkError".to_string(),
                    e.to_string(),
                ));
            }
        }

        Ok(Self {
            inner: InstanceCount(Arc::new(UnsafeCell::new(info.instance_handle))),
            state: info.state,
            export_obj_cache: SavedValue::default(),
            export_obj_async_cache: SavedValue::default(),
			thread_ctx,
        })
    }

    fn add_import<'js>(
        ctx: rquickjs::Ctx<'js>,
        state: &mut State,
        module: &Module,
        import_object: Option<Object<'js>>,
    ) -> Result<Vec<ExternWrapper>> {
        let mut res = Vec::new();
        if let Some(import_object) = import_object {
            for import_ty in module.get_module().imports() {
                if let Ok(obj) = import_object.get::<&str, Object>(import_ty.module()) {
                    if let Ok(val) = obj.get::<&str, Value>(import_ty.name()) {
                        let item = Self::add_import_inner(ctx, state, val.clone(), &import_ty)?;
                        res.push(ExternWrapper {
                            index: import_ty.index(),
                            inner: item,
                        });
                    }
                }
            }
        }
        let mut wasi_import_len: usize = 0;
        for import in module.get_module().imports() {
            if import.module() == "wasi_snapshot_preview1" {
                wasi_import_len += 1;
            }
        }
        if res.len() != module.get_module().imports().len() - wasi_import_len {
            Err(rquickjs::Error::new_type_error(
                "Missing import object".to_string(),
            ))
        } else {
            Ok(res)
        }
    }

    fn add_import_inner<'js>(
        ctx: rquickjs::Ctx<'js>,
        state: &mut State,
        val: Value<'js>,
        ty: &ImportType,
    ) -> Result<Extern> {
        let module_name = ty.module();
        let import_name = ty.name();

        match ty.ty() {
            ExternType::Func(func_ty) => {
                let func = val.into_function().ok_or_else(|| {
                    rquickjs::Error::new_custom_error::<LinkError>(
                        "LinkError".to_string(),
                        format!("function {module_name}.{import_name} not found in import object"),
                    )
                })?;
                if func.is_async_function() {
                    return Err(Error::new_custom_error::<LinkError>(
                        "LinkError".to_string(),
                        "Can not import js async function".to_string(),
                    ));
                }

                state.insert_impfunc(
                    ctx,
                    func.into_value(),
                    func_ty,
                    module_name.to_string(),
                    import_name.to_string(),
					ty.index()
                );
                Ok(Extern::Func(ty.index()))
            }
            ExternType::Memory(mt) => {
                if let Ok(m) = <&Memory as rquickjs::FromJs>::from_js(ctx, val.clone()) {
                    let ty = m.ty();
					let ty_max = ty.maximum().unwrap_or(u32::MAX);
					let mt_max = mt.maximum().unwrap_or(u32::MAX);
                    if (ty.is_shared() && ty != mt)
                        || (!ty.is_shared()
                            && (ty.minimum() < mt.minimum() || ty_max > mt_max))
                    {
                        return Err(Error::new_custom_error::<LinkError>(
                            "LinkError".to_string(),
                            format!(
                                "import Memory {module_name}.{import_name} \
                                    expect {:?}, found {:?}",
                                mt, ty
                            ),
                        ));
                    }
					let persist = Persistent::save(ctx, val);
                    state.js_mem_mut().set_value(persist);
                    Ok(Extern::Memory(unsafe { std::mem::transmute(m) }))
                } else {
                    Err(Error::new_custom_error::<LinkError>(
                        "LinkError".to_string(),
                        format!("memory {module_name}.{import_name} not found in import object"),
                    ))
                }
            }
            ExternType::Global(gt) => {
                if let Ok(g) = val.get::<&Global>() {
                    let gty = g.get_ty();
                    if gt != gty {
                        return Err(rquickjs::Error::new_custom_error::<LinkError>(
                            "LinkError".to_string(),
                            format!("expected global type {:?} but found {:?}", gt, gty),
                        ));
                    }
                    state.js_global_mut().insert(ty.index(), Persistent::save(ctx, val));
                    Ok(Extern::Global(unsafe { std::mem::transmute(g) }))
                } else {
					let cache = if gt.content().is_reference_type() && !val.is_null() {
						SavedValue::new(Persistent::save(ctx, val.clone()))
					} else {
						SavedValue::default()
					};
					let mut ref_cap = RefCapture::new(gt.content());
                    let value = map_js_to_wasm(
						ctx, 
						val, 
						gt.content().clone(), 
						false, 
						false, 
						ref_cap.as_mut()
					).map_err(|e| {
						rquickjs::Error::new_custom_error::<LinkError>(
							"LinkError".to_string(),
							e.to_string(),
						)
					})?;
                    if gt.mutability() == runtime::Mutability::Const {
                        let global =
                            runtime::VMGlobalInstance::new(gt.clone(), value).map_err(|e| {
                                rquickjs::Error::new_custom_error::<LinkError>(
                                    "LinkError".to_string(),
                                    e.to_string(),
                                )
                            })?;
                        let g = Global::Mut(MutGlobal {
                            inner: UnsafeCell::new(ManuallyDrop::new(global)),
                            ty: gt,
							cache,
                            instance_ref: SavedValue::default(),
							ref_cap
                        });
                        let g_js = <Global as rquickjs::IntoJs>::into_js(g, ctx)?;
                        state.js_global_mut().insert(ty.index(), Persistent::save(ctx, g_js.clone()));
                        let g_ref = <&Global as rquickjs::FromJs>::from_js(ctx, g_js).unwrap();
                        Ok(Extern::Global(unsafe { std::mem::transmute(g_ref) }))
                    } else {
                        return Err(rquickjs::Error::new_custom_error::<LinkError>(
                            "LinkError".to_string(),
                            "Mutable global can not be set with primitive value".to_string(),
                        ));
                    }
                }
            }
            ExternType::Table(tt) => {
                let table =
                    <&Table as rquickjs::FromJs>::from_js(ctx, val.clone()).map_err(|_| {
                        rquickjs::Error::new_custom_error::<LinkError>(
                            "LinkError".to_string(),
                            format!("Table {module_name}.{import_name} not found in import object"),
                        )
                    })?;
                let tty = table.inner.ty();
                if tt.minimum() > tty.minimum() || tt.maximum() != tty.maximum() {
                    return Err(rquickjs::Error::new_custom_error::<LinkError>(
                        "LinkError".to_string(),
                        format!(
                            "expected table type {:?} but found {:?}",
                            tt,
                            tty
                        ),
                    ));
                }
				let persist = Persistent::save(ctx, val);
                state.js_table_mut().insert(ty.index(), persist);
                Ok(Extern::Table(unsafe { std::mem::transmute(table) }))
            }
        }
    }

    pub fn get_js_export_obj<'js>(
        &self,
        ctx: rquickjs::Ctx<'js>,
        this: rquickjs::Value<'js>,
        module: runtime::Module,
        is_async: bool,
    ) -> Result<rquickjs::Object<'js>> {
        use rquickjs::IntoJs;
        let obj = Object::new(ctx)?;
        let raw_instance = self.inner.get_instance_inner();
		let state_inner = self.state.get_mut_state();
        for export in module.exports() {
            let value = match export.ty() {
                ExternType::Func(ft) => {
                    // TODO: optimization for import func
                    let func_idx = export.index();
					if let Some(func) = state_inner.get_impfunc(func_idx) {
						func.func_val.0.as_ref().clone().restore(ctx)?
					} else {
						let func_ref = raw_instance.get_func(func_idx);
						let this_clone = this.clone();
						let func = Function {
							inner: func_ref,
							instance_ref: SavedValue::new(Persistent::save(ctx, this_clone)),
							is_async,
						};
						let js_func = rquickjs::Function::new_custom::<Function, u8, u8>(ctx, func)?;
						js_func.set_name(func_idx.to_string())?;
						js_func.set_length(ft.params().len())?;
						js_func.into_value()
					}
                }
                ExternType::Memory(_) => {
					if let Some(mem) = state_inner.js_mem_mut().get_value() {
						mem.restore(ctx)?
					} else {
						let vmmemory = raw_instance.get_memory().unwrap();
						let memory = Memory {
							inner: MemoryRefManager::new(vmmemory),
							buffer_cache: SavedValue::default(),
							instance_ref: Some(self.inner.clone()),
						};
						memory.into_js(ctx)?
					}
                }
                ExternType::Global(ty) => {
					if let Some(g) = state_inner.js_global().get(&export.index()) {
						g.clone().restore(ctx)?
					} else {
						let global = match &raw_instance.module().clone().offsets().globals
							[export.index() as usize]
						{
							VMGlobal::Mut(g) => {
								let vmglobal = unsafe { raw_instance.get_global(g) };
								let mut ref_cap = RefCapture::new(ty.content());
								let persist = Persistent::save(ctx, this.clone());
								if let Some(ref_cap) = ref_cap.as_mut() {
									ref_cap.insert_instanceref(raw_instance.vmctx() as _, persist.clone());
								}
								Global::Mut(MutGlobal {
									inner: UnsafeCell::new(ManuallyDrop::new(vmglobal)),
									ty,
									cache: SavedValue::default(),
									instance_ref: SavedValue::new(persist),
									ref_cap: RefCapture::new(ty.content())
								})
							}
							VMGlobal::Const(g) => Global::Const(ConstGlobal {
								inner: VMGlobalInstance::new(ty, g.val).unwrap(),
								ty,
								instance_ref: SavedValue::new(Persistent::save(ctx, this.clone())),
							}),
						};
						global.into_js(ctx)?
					}
                }
                ExternType::Table(_) => {
					if let Some(t) = state_inner.js_table().get(&export.index()) {
						t.clone().restore(ctx)?
					} else {
						let vmtable = &module.offsets().tables[export.index() as usize];
						let table = unsafe { raw_instance.get_table(vmtable) };
						let mut ref_cap = RefCapture::new(runtime::ValType::Ref(table.ty().element())).unwrap();
						let persist = Persistent::save(ctx, this.clone());
						ref_cap.insert_instanceref(raw_instance.vmctx() as _, persist.clone());
						let table = Table {
							inner: table,
							saved_vec: Vec::new(),
							instance_ref: SavedValue::new(persist),
							ref_cap,
						};
						table.into_js(ctx)?
					}
                }
            };
            obj.prop(export.name(), rquickjs::Property::from(value).enumerable())?;
        }
        obj.clear_prototype()?;
        obj.prevent_extensions()?;
        Ok(obj)
    }

    pub(crate) fn finish_js_task(
        wasm_ctx: WasmMessageCtx,
        module: Box<Module>,
        mut instance: Box<Instance>,
    ) {
        use rquickjs::IntoJs;
        wasm_ctx.spawn_js_task(
            Some(Box::new(move |js_ctx| {
                let context = js_ctx.ctx();
                let obj = context.with(|ctx| {
                    // XXX: need transmute?
                    let ctx = unsafe { std::mem::transmute(ctx) };
					instance.update_memory_after_inst();
                    let instance_ref = instance.into_js(ctx)?;
                    let obj = Object::new(ctx)?;
                    obj.set("module", module)?;
                    obj.set("instance", instance_ref)?;
                    Ok::<_, rquickjs::Error>(obj)
                })?;
                Ok(Box::new(obj))
            })),
            |js_ctx, res| match res {
                Some(Ok(res)) => js_ctx.resolve(res.downcast::<Object>().unwrap()),
                Some(Err(err)) => js_ctx.reject(err),
                _ => unreachable!(),
            },
        );
    }

    pub(crate) fn async_new_post(js_ctx: JsMessageCtx, module: Box<Module>, info: InstanceInfo, thread_ctx: Option<ThreadCtx>) {
        js_ctx.spawn_wasm_task(
            move || {
                let instance = Instance::new_post(info, thread_ctx)?;
                Ok(Box::new(instance))
            },
            move |wasm_ctx, res| match res {
                Some(Ok(res)) => {
                    Instance::finish_js_task(wasm_ctx, module, res.downcast::<Instance>().unwrap())
                }
                Some(Err(err)) => wasm_ctx.reject(err),
                _ => unreachable!(),
            },
        );
    }

	pub fn update_import<'js>(instance_ref: rquickjs::Value<'js>, ctx: rquickjs::Ctx<'js>) -> Result<()> {
		let instance = <&Instance as rquickjs::FromJs>::from_js(ctx, instance_ref.clone())?;
		let state_inner = instance.state.get_mut_state();
		let vmctx = instance.inner.get_instance_inner().vmctx() as usize;
		for value in state_inner.js_global().values() {
			let value = value.clone().restore(ctx)?;
			if let Ok(g) = value.get::<&mut Global>() {
				match g {
					Global::Mut(mg) => {
						if mg.ty.content() == runtime::ValType::Ref(runtime::RefType::FUNCREF) {
							mg.ref_cap.as_mut().unwrap().insert_instanceref(
								vmctx,
								Persistent::save(ctx, instance_ref.clone())
							);
						}
					}
					Global::Const(_) => {}
				}
			}
		}
		for value in state_inner.js_table().values() {
			let value = value.clone().restore(ctx)?;
			if let Ok(t) = <&mut Table as rquickjs::FromJs>::from_js(ctx, value) {
				if t.inner.ty().element() == runtime::RefType::FUNCREF {
					t.ref_cap.insert_instanceref(vmctx, Persistent::save(ctx, instance_ref.clone()));
				}
			}
		}
		Ok(())
	}

	// 创建Instance时会计入线性内存，此处只需更新cur_mem即可
	pub fn update_memory_after_inst(&mut self) {
		let inner = self.inner.get_instance_inner();
		#[cfg(feature = "rust-allocator")]
		rquickjs::memory_size_inc(InstanceInner::vmctx_layout(inner.offsets()).size());
		if let Some(mem) = inner.get_memory() {
			#[cfg(feature = "rust-allocator")]
			rquickjs::memory_size_inc(mem.size() as usize * WASM_PAGE);
			self.inner.get_wrapper().cur_mem += mem.size() as usize;
		}
	}

	pub fn update_memory_after_call(&mut self) -> usize {
		let inner = self.inner.get_instance_inner();
		if let Some(mem) = inner.get_memory() {
			let size = mem.size() as usize;
			let wrapper = self.inner.get_wrapper();
			if size > wrapper.cur_mem {
				#[cfg(feature = "rust-allocator")]
				rquickjs::memory_size_inc((size - wrapper.cur_mem) * WASM_PAGE);
				let gap = (size - wrapper.cur_mem) * WASM_PAGE;
				wrapper.cur_mem = size;
				return gap
			}
			return 0
		}
		0
	}
}

impl Drop for Instance {
	fn drop(&mut self) {
		let vmctx = self.inner.get_instance_inner().vmctx() as usize;
        INSTANCE_REF_MAP.with(|map| {
            map.borrow_mut().remove_value(&vmctx);
        });
	}
}

impl rquickjs::HasRefs for Instance {
    fn mark_refs(&self, marker: &rquickjs::RefsMarker) {
        self.export_obj_cache.mark_refs(marker);
        self.export_obj_async_cache.mark_refs(marker);
        self.state.get_mut_state().mark_refs(marker);
    }
}
