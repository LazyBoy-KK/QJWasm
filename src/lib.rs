#![feature(iterator_try_collect)]
#![feature(hash_set_entry)]

mod object_impl;
#[cfg(feature = "wasi")]
mod wasi;

use once_cell::sync::Lazy;
use std::cell::RefCell;
use rquickjs::ValueMap;
use std::path::PathBuf;

pub use rquickjs;
pub use rquickjs::ContextWrapper;
pub use runtime;

use object_impl::utils::*;

#[cfg(all(not(feature = "external-aot"), not(feature = "jit")))]
compile_error!("You need enable `external-aot` or `jit` to use quickjs-wasm");

static ENGINE: Lazy<runtime::Engine> = Lazy::new(|| {
    let mut config = runtime::Config::default();
    #[cfg(feature = "external-aot")]
    {
        config.aot_compiler = PathBuf::from("/home/kotoba/projects/quickjs-wasm-qemu/wasm/iwasm-rs/target/release/wasm-llvm");
		config.aot_compiler_args = vec![String::from("--disable-native-init")];
    }
    #[cfg(any(feature = "jit", feature = "external-aot"))]
    #[cfg(not(feature = "wasi"))]
    {
        config.force_linkage = Some(runtime::ImportFuncLinkage::FuncRef);
    }
    runtime::Engine::new(config).unwrap()
});

thread_local! {
    // used for get instance reference when constructing to js function objects from wasm functions.
    // js vm in different threads are isolated, which means the map can be implemented as thread
    // local
    static INSTANCE_REF_MAP: RefCell<ValueMap<usize>> = RefCell::new(ValueMap::new());
}

#[rquickjs::bind(object, public, ident = "WebAssembly")]
#[quickjs(rename = "WebAssembly", writable, configurable)]
mod wasm {
    use std::{cell::UnsafeCell, mem::ManuallyDrop, num::NonZeroU64};

    use object_impl::instance::{self, InstanceCount};
    use rquickjs::{
        Context, FromJs, IntoJs, JSValueHandle, Object, Opt, Persistent, Rest, Result, SendSyncContext, SendSyncJsValue, ThreadCtx, Value
    };
    use runtime::{VMExternRef, VMFuncRef, VMTableInstance};

    use crate::object_impl::{
        global::{ConstGlobal, MutGlobal},
        memory::MemoryRefManager,
        module::ModuleWrapper,
        store::StateData,
    };

    use self::object_impl::instance::InstanceInfo;

    use super::*;

    #[quickjs(class_name = "WebAssembly.Module", writable, configurable)]
    pub struct Module {
        pub(crate) inner: ModuleWrapper,
    }

    #[quickjs(writable, enumerable, configurable, length = 1)]
    pub fn compile<'js>(ctx: rquickjs::Ctx<'js>, optional: Rest<Value<'js>>) -> Result<Value<'js>> {
        let buffer = get_optional(optional)
            .ok_or_else(|| rquickjs::Error::new_from_js("Value", "ArrayBuffer or TypedArray"))
            .and_then(|value| {
                let buf: &[u8] = saved_buffer!((i8, u8, i16, u16, i32, u32), value);
                Ok(Vec::from(buf))
            });
        let (promise, resolve, reject) = ctx.promise()?;
        let resolve = SendSyncJsValue::new(ctx, resolve.into_value());
        let reject = SendSyncJsValue::new(ctx, reject.into_value());
        let context = SendSyncContext::new(Context::from_ctx(ctx)?);
		let thread_ctx = ThreadCtx::new(ctx);
        thread_ctx.spawn_wasm_task(
			ctx,
            context,
            Some(Box::new(move || {
                let buf = buffer?;
                let buffer = buf.as_ref();
                let module = Module::new_inner(buffer)?;
                Ok(Box::new(module))
            })),
            |wasm_ctx, res| match res {
                Some(Ok(res)) => wasm_ctx.resolve(res.downcast::<Module>().unwrap()),
                Some(Err(err)) => wasm_ctx.reject(err),
                _ => unreachable!(),
            },
            resolve,
            reject,
            true,
        );
        promise.into_js(ctx)
    }

    #[quickjs(writable, enumerable, configurable)]
    pub fn load<'js>(ctx: rquickjs::Ctx<'js>, path: Value<'js>) -> Result<Module> {
        let path = PathBuf::from(map_js_to_rust_str(ctx, path)?);
        Module::new_from_aot(path)
    }

    #[quickjs(writable, enumerable, configurable)]
    pub fn validate<'js>(buffer: Value<'js>, _optional: Rest<Value<'js>>) -> Result<bool> {
        get_arraybuffer_from_value(buffer, |buf| runtime::Module::validate(&ENGINE, buf).is_ok())
    }

    impl Module {
        pub fn new<'js>(buffer: Value<'js>, _optional: Rest<Value<'js>>) -> Result<Self> {
            get_arraybuffer_from_value(buffer, |buf| Self::new_inner(buf))?
        }

        #[quickjs(rename = "customSections", writable, enumerable, configurable)]
        pub fn custom_sections<'js>(
            ctx: rquickjs::Ctx<'js>,
            module: &'js Module,
            name: Value<'js>,
            _rest: Rest<Value<'js>>,
        ) -> Result<Vec<rquickjs::ArrayBuffer<'js>>> {
            if let Ok(name) = map_js_to_rust_str(ctx, name) {
                module
                    .get_module()
                    .custom_section(&name)
                    .into_iter()
                    .map(|s| rquickjs::ArrayBuffer::new_copy(ctx, s))
                    .collect()
            } else {
                Ok(Vec::new())
            }
        }

        #[quickjs(writable, enumerable, configurable)]
        pub fn exports<'js>(
            ctx: rquickjs::Ctx<'js>,
            module: &'js Module,
            _optional: Rest<Value<'js>>,
        ) -> Result<Vec<Object<'js>>> {
            let mut exports = Vec::new();
            for export in module.get_module().exports() {
                let obj = Object::new(ctx)?;
                obj.set("name", export.name())?;
                obj.set("kind", string_value_of_extern(&export.ty()))?;
                exports.push(obj);
            }
            Ok(exports)
        }

        #[quickjs(writable, enumerable, configurable)]
        pub fn imports<'js>(
            ctx: rquickjs::Ctx<'js>,
            module: &'js Module,
            _optional: Rest<Value<'js>>,
        ) -> Result<Vec<Object<'js>>> {
            let mut imports = Vec::new();
            for import in module.get_module().imports() {
                let obj = Object::new(ctx)?;
                obj.set("module", import.module())?;
                obj.set("name", import.name())?;
                obj.set("kind", string_value_of_extern(&import.ty()))?;
                imports.push(obj);
            }
            Ok(imports)
        }
    }

    #[quickjs(has_refs, class_name = "WebAssembly.Instance", writable, configurable)]
    pub struct Instance {
        pub(crate) inner: InstanceCount,
        pub(crate) state: StateData,
        pub(crate) export_obj_cache: SavedValue,
        pub(crate) export_obj_async_cache: SavedValue,
		pub(crate) thread_ctx: Option<ThreadCtx>,
    }

    #[quickjs(writable, enumerable, configurable, length = 1)]
    pub fn instantiate<'js>(
        ctx: rquickjs::Ctx<'js>,
        module: Opt<Value<'js>>,
        import_object: Rest<Value<'js>>,
    ) -> Result<Value<'js>> {
        match module.into_inner() {
            Some(module) => {
                let import_object = get_optional(import_object);
                let context = SendSyncContext::new(Context::from_ctx(ctx)?);
                let (promise, resolve, reject) = ctx.promise()?;
                let resolve = SendSyncJsValue::new(ctx, resolve.into_value());
                let reject = SendSyncJsValue::new(ctx, reject.into_value());
				let thread_ctx = ThreadCtx::new(ctx);
                if let Ok(module) = <&Module as FromJs>::from_js(ctx, module.clone()) {
                    let new_pre_res = Instance::new_pre(ctx, &module, import_object);
                    thread_ctx.clone().spawn_wasm_task(
						ctx,
                        context,
                        Some(Box::new(move || {
                            let info = new_pre_res?;
                            let instance = Instance::new_post(info, Some(thread_ctx))?;
                            Ok(Box::new(instance))
                        })),
                        |wasm_ctx, res| match res {
                            Some(Ok(res)) => {
                                wasm_ctx.spawn_js_task(
                                    Some(Box::new(move |js_ctx| {
                                        let context = js_ctx.ctx();
                                        let persist = context.with(|ctx| {
                                            let mut instance = res.downcast::<Instance>().unwrap();
											instance.update_memory_after_inst();
											let vmctx = instance.inner.get_instance_inner().vmctx() as usize;
                                            let instance_ref = instance.into_js(ctx)?;
                                            INSTANCE_REF_MAP.with(|map| {
                                                map.borrow_mut().insert_value(vmctx, &instance_ref);
                                            });
											Instance::update_import(instance_ref.clone(), ctx)?;
                                            Ok::<_, rquickjs::Error>(Persistent::save(ctx, instance_ref))
                                        })?;
                                        Ok(Box::new(persist))
                                    })),
                                    |js_ctx, res| match res {
                                        Some(Ok(res)) => js_ctx
                                            .resolve(res.downcast::<Persistent<Value>>().unwrap()),
                                        Some(Err(err)) => js_ctx.reject(err),
                                        _ => unreachable!(),
                                    },
                                );
                            }
                            Some(Err(err)) => wasm_ctx.reject(err),
                            _ => unreachable!(),
                        },
                        resolve,
                        reject,
                        true,
                    );
                    Ok(promise.into_js(ctx)?)
                } else {
                    let buffer = get_arraybuffer_from_value(module, |buf| Vec::from(buf));
                    let import_object =
                        import_object.map(|i| JSValueHandle::new(Persistent::save(ctx, i)));

                    thread_ctx.clone().spawn_wasm_task(
						ctx,
                        context,
                        Some(Box::new(move || {
                            let buffer = buffer?;
                            let module = Module::new_inner(buffer.as_ref())?;
                            Ok(Box::new(module))
                        })),
                        |wasm_ctx, res| match res {
                            Some(Ok(res)) => {
                                let module = res.downcast::<Module>().unwrap();
                                wasm_ctx.spawn_js_task(
                                    Some(Box::new(move |js_ctx| {
                                        let context = js_ctx.ctx();
                                        let info = context.with(|ctx| {
                                            let import_object = match import_object {
                                                Some(i) => Some(i.0.as_ref().clone().restore(ctx)?),
                                                None => None,
                                            };
                                            Instance::new_pre(ctx, &module, import_object)
                                        })?;
                                        Ok(Box::new((module, info)))
                                    })),
                                    move |js_ctx, res| match res {
                                        Some(Ok(res)) => {
                                            let pre_component = res
                                                .downcast::<(Box<Module>, InstanceInfo)>()
                                                .unwrap();
                                            let module = pre_component.0;
                                            let info = pre_component.1;
                                            Instance::async_new_post(js_ctx, module, info, Some(thread_ctx))
                                        }
                                        Some(Err(err)) => js_ctx.reject(err),
                                        _ => unreachable!(),
                                    },
                                );
                            }
                            Some(Err(err)) => wasm_ctx.reject(err),
                            _ => unreachable!(),
                        },
                        resolve,
                        reject,
                        true,
                    );
                    Ok(promise.into_value())
                }
            }
            None => {
                let (promise, _, reject) = ctx.promise()?;
				reject.call::<_, rquickjs::Value>((rquickjs::Error::new_type_error(
					"Missing argument: WebAssembly.Module or wasm buffer".to_string(),
				).into_js(ctx)?, ))?;
                promise.into_js(ctx)
            }
        }
    }

    impl Instance {
        pub fn new<'js>(
            ctx: rquickjs::Ctx<'js>,
            module: &Module,
            import_object: Rest<Value<'js>>,
        ) -> Result<Value<'js>> {
            let import_object = get_optional(import_object);
            let info = Self::new_pre(ctx, module, import_object)?;
            let mut instance = Self::new_post(info, None)?;
			let vmctx = instance.inner.get_instance_inner().vmctx() as usize;
			instance.update_memory_after_inst();
            let instance_ref = instance.into_js(ctx)?;
            INSTANCE_REF_MAP.with(|map| {
                map.borrow_mut().insert_value(vmctx, &instance_ref);
            });
			Instance::update_import(instance_ref.clone(), ctx)?;
            Ok(instance_ref)
        }

        #[quickjs(get, enumerable, configurable, func_name = "get exports")]
        pub fn exports<'js>(
            &mut self,
            ctx: rquickjs::Ctx<'js>,
            this: rquickjs::This<Value<'js>>,
            _rest: Rest<Value<'js>>,
        ) -> Result<Value<'js>> {
            let module = self.inner.get_instance_inner().module().clone();
            if let None = self.export_obj_cache.get_value() {
                let obj = self.get_js_export_obj(ctx, this.into_inner(), module, false)?;
                self.export_obj_cache
                    .set_value(Persistent::save(ctx, obj.into_value()));
            }

            self.export_obj_cache
                .get_value()
                .unwrap() // This unwrap is checked
                .restore(ctx)
        }

        #[quickjs(
            rename = "exportsAsync",
            get,
            enumerable,
            configurable,
            func_name = "get exportsAsync"
        )]
        pub fn exports_async<'js>(
            &mut self,
            ctx: rquickjs::Ctx<'js>,
            this: rquickjs::This<Value<'js>>,
            _rest: Rest<Value<'js>>,
        ) -> Result<Value<'js>> {
            let module = self.inner.get_instance_inner().module().clone();
            if let None = self.export_obj_async_cache.get_value() {
                let obj = self.get_js_export_obj(ctx, this.into_inner(), module, true)?;
                self.export_obj_async_cache
                    .set_value(Persistent::save(ctx, obj.into_value()));
            }

            self.export_obj_async_cache
                .get_value()
                .unwrap() // This unwrap is checked
                .restore(ctx)
        }
    }

    #[quickjs(has_refs, class_name = "WebAssembly.Memory", writable, configurable)]
    pub struct Memory {
        pub(crate) inner: MemoryRefManager,
        pub(crate) buffer_cache: SavedValue,
        pub(crate) instance_ref: Option<InstanceCount>,
        pub(crate) safeguard: SharedSafeGuard,
    }

    impl Memory {
        pub fn new<'js>(
            ctx: rquickjs::Ctx<'js>,
            desc: Object<'js>,
            _rest: Rest<Value<'js>>,
        ) -> Result<Self> {
            let initial_value: Value = desc.get("initial")?;
            let minimum_value: Value = desc.get("minimum")?;
            if !initial_value.is_undefined()
                && !initial_value.is_null()
                && !minimum_value.is_undefined()
                && !minimum_value.is_null()
            {
                return Err(rquickjs::Error::new_type_error(
                    "Initializing with both initial and minimum is not allowed".to_string(),
                ));
            }
            let initial: u32 = if let Ok(value) = convert_js_value_to_uint(ctx, initial_value) {
                value
            } else {
                convert_js_value_to_uint(ctx, minimum_value)?
            };
            let maximum: Option<u32> = map_js_to_u32(ctx, desc.get("maximum")?)?;
            if maximum.is_some() && initial > maximum.unwrap() {
                return Err(rquickjs::Error::new_range_error(
                    "Out-of-range initial value in descriptor".to_string(),
                ));
            }
            if maximum.is_some() && maximum.unwrap() == 0 {
                return Err(rquickjs::Error::new_range_error(
                    "Maximum must not be 0".to_string(),
                ));
            }
            let shared: bool = desc.get("shared").unwrap_or(false);
            let ty = if shared {
                runtime::MemoryType::shared(
                    initial,
                    maximum.ok_or_else(|| {
                        rquickjs::Error::new_type_error(
                            "Shared Memory without maximum is not allowed".to_string(),
                        )
                    })?,
                )
            } else {
                runtime::MemoryType::new(initial, maximum)
            };
            let mem_instance = runtime::VMMemoryInstance::new(&ENGINE, ty).map_err(|e| {
                rquickjs::Error::new_custom_error::<RuntimeError>(
                    "RuntimeError".to_string(),
                    e.to_string(),
                )
            })?;
            Ok(Memory {
                inner: MemoryRefManager::new(mem_instance),
                buffer_cache: SavedValue::default(),
                instance_ref: None,
                safeguard: SharedSafeGuard::new(),
            })
        }

        #[quickjs(get, enumerable, configurable, func_name = "get buffer")]
        pub fn buffer<'js>(
            &mut self,
            ctx: rquickjs::Ctx<'js>,
            _rest: Rest<Value<'js>>,
        ) -> Result<Value<'js>> {
            if self.safeguard.get() {
                return Ok(rquickjs::Value::new_undefined(ctx));
            }
            let (ptr, len) = self.get_memory_buffer();
            if let Some(persist_value) = self.buffer_cache.get_value() {
                let buffer = rquickjs::ArrayBuffer::from_value(persist_value.restore(ctx)?)?;
                if buffer.len() != len {
                    self.buffer_cache.get_own_value();
                }
            }
            if self.buffer_cache.get_value().is_none() {
                let ty = self.ty();
                let buffer = if !ty.is_shared() {
                    unsafe {
                        rquickjs::ArrayBuffer::new_raw(
                            ctx,
                            ptr,
                            len,
                            (self.instance_ref.clone(), self.inner.clone()),
                            |_, _, s| drop(s),
                        )?
                    }
                } else {
                    unsafe {
                        rquickjs::ArrayBuffer::new_shared(
                            ctx,
                            ptr,
                            len,
                            std::sync::Arc::new((self.instance_ref.clone(), self.inner.clone())),
                        )?
                    }
                };
                self.buffer_cache
                    .set_value(Persistent::save(ctx, buffer.into_value()));
            }
            self.buffer_cache.get_value().unwrap().restore(ctx)
        }

        #[quickjs(writable, enumerable, configurable)]
        pub fn grow<'js>(
            &mut self,
            ctx: rquickjs::Ctx<'js>,
            count: Value<'js>,
            _rest: Rest<Value<'js>>,
        ) -> Result<u32> {
            if self.safeguard.get() {
                return Ok(0);
            }
            let count = convert_js_value_to_uint(ctx, count)?;
            let res = self.grow_memory(count)?;
			if let Some(instance) = &self.instance_ref {
				let wrapper = instance.get_wrapper();
				#[cfg(all(feature = "quickjs-libc", not(feature = "quickjs-libc-test")))]
				ctx.inc_malloc_size((res as usize - wrapper.cur_mem) * instance::WASM_PAGE);
				wrapper.cur_mem = res as usize;
			}
            if let Some(value) = self.buffer_cache.get_own_value() {
                let value = value.restore(ctx)?;
                let mut buffer = rquickjs::ArrayBuffer::from_value(value)?;
                buffer.detach();
            }
            Ok(res)
        }

        #[quickjs(rename = "type")]
        pub fn memory_type<'js>(&self, ctx: rquickjs::Ctx<'js>) -> Result<Object<'js>> {
            let obj = rquickjs::Object::new(ctx)?;
            let ty = self.ty();
            obj.set("minimum", ty.minimum())?;
            obj.set("maximum", ty.maximum())?;
            obj.set("shared", ty.is_shared())?;
            Ok(obj)
        }
    }

    #[quickjs(class_name = "WebAssembly.Global", writable, configurable, has_refs)]
    pub enum Global {
        Mut(MutGlobal),
        Const(ConstGlobal),
    }

    impl Global {
        pub fn new<'js>(
            ctx: rquickjs::Ctx<'js>,
            desc: Object<'js>,
            rest: Rest<Value<'js>>,
        ) -> Result<Self> {
            let mutable = Self::get_mutability(desc.get("mutable")?)?;
            let val_type: String = map_js_to_rust_str(ctx, desc.get("value")?)?;
            let ty = match val_type.as_str() {
                "i32" => runtime::ValType::I32,
                "i64" => runtime::ValType::I64,
                "f32" => runtime::ValType::F32,
                "f64" => runtime::ValType::F64,
				"funcref" => runtime::ValType::Ref(runtime::RefType::FUNCREF),
				"externref" => runtime::ValType::Ref(runtime::RefType::EXTERNREF),
                _ => return Err(rquickjs::Error::new_type_error("invalid type of global".to_string())),
            };
            let value = get_optional(rest);
			let mut ref_capture = RefCapture::new(ty);
            let (val, cache) = if let Some(v) = value.as_ref() {
				let cache = if ty.is_reference_type() && !v.is_null() {
					SavedValue::new(Persistent::save(ctx, v.clone()))
				} else {
					SavedValue::default()
				};
                (map_js_to_wasm(ctx, v.clone(), ty.clone(), true, true, ref_capture.as_mut())?, cache)
            } else {
                (match ty {
                    runtime::ValType::I32 => runtime::Val::I32(0),
                    runtime::ValType::I64 => runtime::Val::I64(0),
                    runtime::ValType::F32 => runtime::Val::F32(0.0f32),
                    runtime::ValType::F64 => runtime::Val::F64(0.0f64),
					runtime::ValType::Ref(runtime::RefType::FUNCREF) => runtime::Val::FuncRef(None),
					runtime::ValType::Ref(runtime::RefType::EXTERNREF) => runtime::Val::ExternRef(None),
                    _ => unreachable!()
                }, SavedValue::default())
            };
            let ty = runtime::GlobalType::new(ty, mutable);
            let global = runtime::VMGlobalInstance::new(ty, val).map_err(|e| {
                rquickjs::Error::new_custom_error::<RuntimeError>(
                    "RuntimeError".to_string(),
                    e.to_string(),
                )
            })?;
            Ok(Global::Mut(MutGlobal {
                inner: UnsafeCell::new(ManuallyDrop::new(global)),
                ty,
				cache,
                instance_ref: SavedValue::default(),
				ref_cap: ref_capture,
                safeguard: SharedSafeGuard::new(),
            }))
        }

        #[quickjs(
            rename = "value",
            func_name = "get value",
            get,
            enumerable,
            configurable
        )]
        pub fn get_value<'js>(
            &mut self,
            ctx: rquickjs::Ctx<'js>,
            _rest: Rest<Value<'js>>,
        ) -> Result<Value<'js>> {
            self.get_impl(ctx)
        }

        #[quickjs(
            rename = "value",
            func_name = "set value",
            set,
            enumerable,
            configurable
        )]
        pub fn set_value<'js>(
            &mut self,
            ctx: rquickjs::Ctx<'js>,
            val: Value<'js>,
            _rest: Rest<Value<'js>>,
        ) -> Result<()> {
            let ty = self.get_ty();
            if ty.mutability() == runtime::Mutability::Const {
                return Err(rquickjs::Error::new_type_error(format!(
                    "can't set immutable global value"
                )));
            }
			let ref_cap = match self {
				Global::Mut(mg) => mg.ref_cap.as_mut(),
				Global::Const(_) => unreachable!()
			};
            let value = map_js_to_wasm(ctx, val.clone(), ty.content().clone(), true, false, ref_cap)?;
            self.set_impl(ctx, value, val)?;
            Ok(())
        }

        #[quickjs(rename = "valueOf", writable, enumerable, configurable)]
        pub fn value_of<'js>(
            &mut self,
            ctx: rquickjs::Ctx<'js>,
            rest: Rest<Value<'js>>,
        ) -> Result<Value<'js>> {
            self.get_value(ctx, rest)
        }

        #[quickjs(rename = "type")]
        pub fn global_type<'js>(&self, ctx: rquickjs::Ctx<'js>) -> Result<Object<'js>> {
            self.get_global_type_obj(ctx, self.get_ty())
        }
    }

    #[quickjs(has_refs, class_name = "WebAssembly.Table", writable, configurable)]
    pub struct Table {
        pub(crate) inner: VMTableInstance,
        pub(crate) saved_vec: Vec<SavedValue>,
		pub(crate) instance_ref: SavedValue,
		pub(crate) ref_cap: RefCapture,
        pub(crate) safeguard: SharedSafeGuard,
    }

    impl Table {
        pub fn new<'js>(
            ctx: rquickjs::Ctx<'js>,
            desc: Object<'js>,
            init: Opt<Value<'js>>,
            _rest: Rest<Value<'js>>,
        ) -> Result<Self> {
            let element: String = map_js_to_rust_str(ctx, desc.get("element")?)?;
            let initial_value: Value = desc.get("initial")?;
            let minimum_value: Value = desc.get("minimum")?;
            if !initial_value.is_undefined()
                && !initial_value.is_null()
                && !minimum_value.is_undefined()
                && !minimum_value.is_null()
            {
                return Err(rquickjs::Error::new_type_error(
                    "Initializing with both initial and minimum is not allowed".to_string(),
                ));
            }
            let initial = if let Ok(value) = convert_js_value_to_uint(ctx, initial_value) {
                value
            } else {
                convert_js_value_to_uint(ctx, minimum_value)?
            };
            let maximum: Option<u32> = map_js_to_u32(ctx, desc.get("maximum")?)?;
            if maximum.is_some() && (maximum.unwrap() < initial || maximum.unwrap() == 0) {
                return Err(rquickjs::Error::new_range_error(
                    "Maximum must be greater than or equal to initial length and shouldn't be 0"
                        .to_string(),
                ));
            }
            let val_type = if element == "anyfunc" || element == "funcref" {
                runtime::RefType::FUNCREF
            } else if element == "externref" {
				runtime::RefType::EXTERNREF
			} else {
                return Err(rquickjs::Error::new_type_error(
                    "invalid table type".to_string(),
                ));
            };
            let ty = runtime::TableType::new(val_type, initial, maximum);
            let mut saved_vec = Vec::new();
            let (inner, ref_cap) = if element == "anyfunc" || element == "funcref" {
                let (saved_value, func_ref, ref_cap) = init.into_inner().map_or_else(
                    || {
                        Ok::<(SavedValue, VMFuncRef, RefCapture), rquickjs::Error>((
                            SavedValue::default(),
                            VMFuncRef::null(),
							RefCapture::new(runtime::ValType::Ref(ty.element())).unwrap(),
                        ))
                    },
                    |value| {
                        let func = Self::get_exported_func(&value)?;
                        if func.is_async {
                            return Err(rquickjs::Error::new_type_error(
                                "Async function can't be set in table".to_string(),
                            ));
                        }
						let mut ref_cap = RefCapture::new(runtime::ValType::Ref(ty.element())).unwrap();
						ref_cap.insert_instanceref(func.inner.caller as usize, func.instance_ref.get_value().unwrap());
                        let persist = Persistent::save(ctx, value.clone());
                        let func_ref = func.inner.clone();
                        Ok((SavedValue::new(persist), func_ref, ref_cap))
                    },
                )?;
                saved_vec.resize(initial as usize, saved_value);
                (VMTableInstance::new_func(&ENGINE, ty.clone(), func_ref).unwrap(), ref_cap)
            } else {
                let (saved_value, extern_ref, ref_cap) = init.into_inner().map_or_else(
                    || {
                        Ok::<(SavedValue, VMExternRef, RefCapture), rquickjs::Error>((
                            SavedValue::default(),
                            VMExternRef(None),
							RefCapture::new(runtime::ValType::Ref(ty.element())).unwrap(),
                        ))
                    },
                    |value| {
						let mut ref_cap = RefCapture::new(runtime::ValType::Ref(ty.element())).unwrap();
						let persist = Persistent::save(ctx, value);
						let ptr = ref_cap.insert_externref(persist.clone()).unwrap();
                        Ok((SavedValue::new(persist), VMExternRef(Some(NonZeroU64::new(ptr as u64).unwrap())), ref_cap))
                    },
                )?;
                saved_vec.resize(initial as usize, saved_value);
                (VMTableInstance::new_extern(&ENGINE, ty.clone(), extern_ref).unwrap(), ref_cap)
            };
            Ok(Self {
                inner,
                saved_vec,
				instance_ref: SavedValue::default(),
				ref_cap,
                safeguard: SharedSafeGuard::new(),
            })
        }

        #[quickjs(writable, enumerable, configurable)]
        pub fn get<'js>(
            &mut self,
            ctx: rquickjs::Ctx<'js>,
            index: Value<'js>,
            _rest: Rest<Value<'js>>,
        ) -> Result<Value<'js>> {
            if self.safeguard.get() {
                return Ok(rquickjs::Value::new_undefined(ctx));
            }
            let index = map_js_to_u32(ctx, index)?
                .ok_or_else(|| rquickjs::Error::new_from_js("Value", "positive int"))?;
            self.get_impl(ctx, index)
        }

        #[quickjs(writable, enumerable, configurable)]
        pub fn set<'js>(
            &mut self,
            ctx: rquickjs::Ctx<'js>,
            index: Value<'js>,
            rest: Rest<Value<'js>>,
        ) -> Result<()> {
            if self.safeguard.get() {
                return Err(rquickjs::Error::new_custom_error::<RuntimeError>(
                    "RuntimeError".to_string(), 
                    "safeguard violated".to_string()
                ));
            }
            let index = convert_js_value_to_uint(ctx, index)?;
            let value = get_optional(rest).unwrap_or(Value::new_null(ctx));
            self.set_impl(ctx, index, value)
        }

        #[quickjs(writable, enumerable, configurable)]
        pub fn grow<'js>(
            &mut self,
            ctx: rquickjs::Ctx<'js>,
            delta: Value<'js>,
            init: Opt<Value<'js>>,
            _rest: Rest<Value<'js>>,
        ) -> Result<u32> {
            if self.safeguard.get() {
                return Ok(0);
            }
            let delta = convert_js_value_to_uint(ctx, delta)?;
            let value = init.into_inner().unwrap_or(Value::new_null(ctx));
            self.grow_impl(ctx, delta, value)
        }

        #[quickjs(get, enumerable, configurable, func_name = "get length")]
        pub fn length(&self, _rest: Rest<Value>) -> u32 {
            if self.safeguard.get() {
                return 0;
            }
            self.inner.size()
        }

        #[quickjs(rename = "type")]
        pub fn table_type<'js>(&self, ctx: rquickjs::Ctx<'js>) -> Result<Object<'js>> {
            let obj = rquickjs::Object::new(ctx)?;
            obj.set("minimum", self.inner.ty().minimum())?;
            obj.set("maximum", self.inner.ty().maximum())?;
            obj.set("element", "funcref")?; // TODO: externref
            Ok(obj)
        }
    }

    #[quickjs(has_refs, class_name = "WebAssembly.Function", is_func)]
    pub struct Function {
        pub(crate) inner: runtime::VMFuncRef,
        pub(crate) instance_ref: SavedValue,
        pub(crate) is_async: bool,
    }

    #[quickjs(
        class_name = "WebAssembly.CompileError",
        error_subtype,
        writable,
        configurable
    )]
    pub struct CompileError;

    impl CompileError {
        pub fn new(ctx: rquickjs::Ctx, message: rquickjs::Opt<String>) -> Result<Object> {
            let error = Object::new_error(ctx)?;
            error.set("message", message.into_inner().unwrap_or(String::from("")))?;
            error.set("name", "CompileError")?;
            Ok(error)
        }
    }

    #[quickjs(
        class_name = "WebAssembly.LinkError",
        error_subtype,
        writable,
        configurable
    )]
    pub struct LinkError;

    impl LinkError {
        pub fn new(ctx: rquickjs::Ctx, message: rquickjs::Opt<String>) -> Result<Object> {
            let error = Object::new_error(ctx)?;
            error.set("message", message.into_inner().unwrap_or(String::from("")))?;
            error.set("name", "LinkError")?;
            Ok(error)
        }
    }

    #[quickjs(
        class_name = "WebAssembly.RuntimeError",
        error_subtype,
        writable,
        configurable
    )]
    pub struct RuntimeError;

    impl RuntimeError {
        pub fn new(ctx: rquickjs::Ctx, message: rquickjs::Opt<String>) -> Result<Object> {
            let error = Object::new_error(ctx)?;
            error.set("message", message.into_inner().unwrap_or(String::from("")))?;
            error.set("name", "RuntimeError")?;
            Ok(error)
        }
    }
}

#[rquickjs::bind(object, public)]
#[quickjs(bare)]
mod text_utils {
    use super::wasm;
    use rquickjs::{Error, Opt, Result};
    #[derive(Copy, Clone)]
    #[quickjs(cloneable)]
    pub struct TextDecoder;

    impl TextDecoder {
        pub fn new(label: Opt<String>) -> Result<Self> {
            if let Some(label) = label.into_inner() {
                if label != "utf-8" {
                    return Err(Error::new_custom_error::<wasm::RuntimeError>(
                        "RuntimeError".to_string(),
                        "Only utf-8 is supported".to_owned(),
                    ));
                }
            }
            Ok(Self)
        }

        pub fn decode(&self, buffer: rquickjs::Value) -> Result<String> {
            let s = crate::get_arraybuffer_from_value(buffer, |buf| {
                String::from_utf8_lossy(buf).to_string()
            })?;
            Ok(s)
        }
    }

    #[derive(Copy, Clone)]
    #[quickjs(cloneable)]
    pub struct TextEncoder;

    impl TextEncoder {
        pub fn new() -> Self {
            Self
        }

        pub fn encode<'js>(
            &self,
            ctx: rquickjs::Ctx<'js>,
            string: rquickjs::String<'js>,
        ) -> Result<rquickjs::Value<'js>> {
            let rust_str = string.to_string()?;
            let bytes = rust_str.as_bytes();
            Ok(rquickjs::TypedArray::<u8>::new_copy(ctx, bytes)?.into_value())
        }

        #[quickjs(rename = "encodeInto")]
        pub fn encode_into<'js>(
            &self,
            ctx: rquickjs::Ctx<'js>,
            string: rquickjs::String<'js>,
            mut array: rquickjs::TypedArray<'js, u8>,
        ) -> Result<rquickjs::Object<'js>> {
            let rust_str = string.to_string()?;
            let bytes = rust_str.as_bytes();
            let buf: &mut [u8] = array.as_mut();
            let obj = rquickjs::Object::new(ctx)?;
            obj.set("read", bytes.len())?;
            if bytes.len() <= buf.len() {
                buf[0..bytes.len()].copy_from_slice(bytes);
                obj.set("written", bytes.len())?;
            } else {
                buf.copy_from_slice(&bytes[0..buf.len()]);
                obj.set("write", buf.len())?;
            }
            Ok(obj)
        }
    }
}

impl rquickjs::DeepSizeOf for text_utils::TextDecoder {}
impl rquickjs::DeepSizeOf for text_utils::TextEncoder {}

fn init<'js>(ctx: rquickjs::Ctx<'js>, val: rquickjs::Value<'js>) -> rquickjs::Result<()> {
	use rquickjs::ObjectDef;
    let global = rquickjs::Object::from_value(val)?;
    WebAssembly::init(ctx, &global)?;
    TextUtils::init(ctx, &global)?;
    let wasm: rquickjs::Object = global.get("WebAssembly")?;
    let to_string_tag =
        unsafe { rquickjs::Atom::from_atom_val(ctx, rquickjs::qjs::JS_ATOM_Symbol_toStringTag) };
    wasm.prop(
        to_string_tag,
        rquickjs::Property::from("WebAssembly").configurable(),
    )?;
    Ok(())
}

#[export_name = "JS_AddIntrinsicWebAssembly"]
pub unsafe extern "C" fn js_add_intrinsic_web_assembly(ctx: *mut rquickjs::qjs::JSContext) {
    let global = rquickjs::qjs::JS_GetGlobalObject(ctx);
    rquickjs::Context::init_raw(ctx);
    let ctx = rquickjs::Ctx::from_ptr(ctx);
    let object = rquickjs::Value::from_js_value(ctx, global);
    if let Err(e) = init(ctx, object) {
        e.throw(ctx);
    }
}

#[export_name = "JS_InitOpaqueInRust"]
pub unsafe extern "C" fn js_init_opaque_in_rust(rt: *mut rquickjs::qjs::JSRuntime, need_drop: std::ffi::c_int) {
    rquickjs::Runtime::init_opaque(rt, #[cfg(feature = "rust-allocator")]None, need_drop > 0);
}
