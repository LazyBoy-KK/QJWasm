use rquickjs::{Context, ContextWrapper, DeepSizeCtx, ImportJsFuncRes, JSValueHandle, Persistent};
use runtime::{FuncType, ValRaw, VMContext, VMArrayCallContext, VMArrayCall};
use std::{cell::UnsafeCell, collections::HashMap, sync::Arc};

#[cfg(feature = "wasi")]
use wasi_common::{WasiCtx, sync::{WasiCtxBuilder, Dir, ambient_authority}};

use crate::{
    object_impl::utils::call_func, wasm, RefCapture, SavedValue, SendSlices
};

#[derive(Clone)]
pub struct JSImpFunc {
    pub func_val: JSValueHandle,
    pub ty: runtime::FuncType,
    pub module_name: String,
    pub import_name: String,
}

impl rquickjs::DeepSizeOf for JSImpFunc {
	fn deep_size_of_children(&self, context: &mut DeepSizeCtx) -> usize {
		self.module_name.deep_size_of_children(context) + 
			self.import_name.deep_size_of_children(context)
	}
}

pub struct JSSideState {
    // Reference count for js context
    // Js context will be dropped after calling function in case of gc error.
    // There is nothing wrong when calling synchronous functions. However,
    // in an asynchronous function, dropping js context after calling it leads to 
    // RuntimeError since that other asynchronous functions will also access it.
    // So we have to manage its lifetime by using reference count.
    ctx_ref: i32,
    ctx: Option<ContextWrapper>,
    // js import functions
    funcs: HashMap<u32, JSImpFunc>,
    // js value of imported objects other than import functions and globals
    js_mem: SavedValue,
	js_global: HashMap<u32, Persistent<rquickjs::Value<'static>>>,
	js_table: HashMap<u32, Persistent<rquickjs::Value<'static>>>,
	captured_instanceref: RefCapture,
	captured_externref: RefCapture,
}

impl rquickjs::DeepSizeOf for JSSideState {
	fn deep_size_of_children(&self, context: &mut DeepSizeCtx) -> usize {
		self.funcs.deep_size_of_children(context) + 
			self.js_global.len() * size_of::<Persistent<rquickjs::Value<'static>>>() +
			self.js_table.len() * size_of::<Persistent<rquickjs::Value<'static>>>() + 
			self.captured_externref.deep_size_of() + self.captured_instanceref.deep_size_of()
	}
}

pub type ArrayCall = dyn Fn(*mut VMContext, *mut ValRaw) -> runtime::Result<()>;

pub struct ArrayCallInfo {
    pub array_call: Box<ArrayCall>,
    pub vmctx: *mut VMContext,
}

impl Drop for ArrayCallInfo {
    fn drop(&mut self) {
        let arr_vmctx = self.vmctx as *mut VMArrayCallContext;
        unsafe {
            let _ = Box::from_raw(VMArrayCall::from_vmctx(arr_vmctx.cast()));
        }
    }
}

impl rquickjs::DeepSizeOf for ArrayCallInfo {
	fn deep_size_of_children(&self, _context: &mut DeepSizeCtx) -> usize {
		core::mem::size_of_val(self.array_call.as_ref())
	}
}

pub struct WasmSideState {
    array_calls: Vec<ArrayCallInfo>,
    #[cfg(feature = "wasi")]
    wasi_ctx: WasiCtx,
}

impl rquickjs::DeepSizeOf for WasmSideState {
	fn deep_size_of_children(&self, context: &mut DeepSizeCtx) -> usize {
		self.array_calls.deep_size_of_children(context)
	}
}

#[derive(Clone)]
pub struct StateData(Arc<UnsafeCell<State>>);

impl StateData {
    pub fn new(state: State) -> Self {
        Self(Arc::new(UnsafeCell::new(state)))
    }

    pub fn get_mut_state(&self) -> &mut State {
        unsafe { &mut *self.0.get() }
    }

	pub unsafe fn call_func(&self, index: u32, params: *mut ValRaw) -> runtime::Result<()> {
		let state_inner = self.get_mut_state();
		let impfunc = state_inner.get_impfunc(index).unwrap().clone();
		let args_len =
			impfunc.ty.params().len().max(impfunc.ty.results().len());
		let val_raws = std::slice::from_raw_parts_mut(params, args_len);
		// Safety: wa2x thread will be blocked when executing import functions
		let val_raws = SendSlices(std::mem::transmute(val_raws));

		// ctx won't be None when calling wasm functions
		if state_inner.get_ctx().unwrap().async_ctx().is_main_thread() {
			let ctx = state_inner.get_ctx().unwrap().clone();
			self.call_func_inner(ctx, impfunc, val_raws).map_err(
				|e| runtime::Error::Custom { error: Box::new(e) },
			)?;
		} else {
			let res = self.spawn_js_task(impfunc, val_raws);
			res.get().expect("import js task crashed").map_err(|e| {
				runtime::Error::Custom { error: Box::new(e) }
			})?;
		}
		Ok(())
	}

	pub fn spawn_js_task(
        &self,
        impfunc: JSImpFunc,
        val_raws: SendSlices<'static, ValRaw>,
    ) -> ImportJsFuncRes {
		let state_inner = self.get_mut_state();
        let context_wrapper = state_inner.js.ctx.clone().unwrap();
        let ctx = context_wrapper.clone();
		let state_data = self.clone();
        // Runtime opaque won't be updated when calling wasm functions
        ctx.async_ctx().spawn_import_js_task(move || {
            state_data.call_func_inner(
                context_wrapper,
                impfunc,
                val_raws
            )
        })
    }

	pub fn call_func_inner(
		&self,
        context_wrapper: ContextWrapper,
        impfunc: JSImpFunc,
        val_raws: SendSlices<ValRaw>,
    ) -> rquickjs::Result<()> {
        let res = context_wrapper.with(|ctx| {
            let func = impfunc.func_val
                .0
                .as_ref()
                .clone()
                .restore(ctx)?
                .into_function()
                .unwrap();
            call_func(
                ctx,
                func,
				self.get_mut_state(),
                &impfunc.ty,
                &impfunc.module_name,
                &impfunc.import_name,
                val_raws.0
            )?;
            Ok(())
        });
        res
    }
}

// used in init import function
// State will only be updated in js thread
unsafe impl Send for StateData {}
unsafe impl Sync for StateData {}

impl rquickjs::DeepSizeOf for StateData {
	fn deep_size_of_children(&self, context: &mut DeepSizeCtx) -> usize {
		self.get_mut_state().deep_size_of_children(context)
	}
}

pub struct State {
    js: JSSideState,
    wasm: WasmSideState,
}

impl rquickjs::DeepSizeOf for State {
	fn deep_size_of_children(&self, context: &mut DeepSizeCtx) -> usize {
		self.js.deep_size_of_children(context) +
			self.wasm.deep_size_of_children(context)
	}
}

impl State {
    pub fn new() -> Self {
        #[cfg(feature = "wasi")]
        let wasi_ctx = {
            let mut builder = WasiCtxBuilder::new();
            builder.inherit_stdout()
                .inherit_stderr()
                .inherit_env().unwrap();
            let dir = Dir::open_ambient_dir(std::env::current_dir().unwrap(), ambient_authority())
                .unwrap();
            builder.preopened_dir(dir, "/").unwrap();
            builder.build()
        };

        State {
            wasm: WasmSideState {
                array_calls: Vec::new(),
                #[cfg(feature = "wasi")]
                wasi_ctx,
            },
            js: JSSideState {
                ctx_ref: 0,
                ctx: None,
                funcs: HashMap::new(),
                js_mem: SavedValue::default(),
				js_global: HashMap::new(),
				js_table: HashMap::new(),
				captured_instanceref: RefCapture::new(runtime::ValType::Ref(runtime::RefType::FUNCREF)).unwrap(),
				captured_externref: RefCapture::new(runtime::ValType::Ref(runtime::RefType::EXTERNREF)).unwrap(),
            },
        }
    }

    pub fn get_wasm_array_calls_mut(&mut self) -> &mut Vec<ArrayCallInfo> {
        &mut self.wasm.array_calls
    }

    pub fn get_ctx(&self) -> Option<&ContextWrapper> {
        self.js.ctx.as_ref()
    }

    #[cfg(feature = "wasi")]
    pub fn get_wasi_ctx(&mut self) -> &mut WasiCtx {
        &mut self.wasm.wasi_ctx
    }

    pub fn js_mem_mut<'js>(&mut self) -> &mut SavedValue {
        &mut self.js.js_mem
    }

	pub fn js_global(&self) -> &HashMap<u32, Persistent<rquickjs::Value<'static>>> {
		&self.js.js_global
	}

	pub fn js_global_mut(&mut self) -> &mut HashMap<u32, Persistent<rquickjs::Value<'static>>> {
		&mut self.js.js_global
	}

	pub fn js_table(&self) -> &HashMap<u32, Persistent<rquickjs::Value<'static>>> {
		&self.js.js_table
	}

	pub fn js_table_mut(&mut self) -> &mut HashMap<u32, Persistent<rquickjs::Value<'static>>> {
		&mut self.js.js_table
	}

    pub fn inc_ctx_ref(&mut self, ctx: rquickjs::Ctx) -> rquickjs::Result<()> {
        if self.js.ctx.is_none() {
            return self.init_ctx(ctx);
        }
        self.js.ctx_ref += 1;
        Ok(())
    }

	pub fn instanceref_cap(&mut self) -> &mut RefCapture {
		&mut self.js.captured_instanceref
	}

	pub fn externref_cap(&mut self) -> &mut RefCapture {
		&mut self.js.captured_externref
	}

    pub fn dec_ctx_ref(&mut self) -> rquickjs::Result<()> {
        if self.js.ctx.is_none() {
            return Err(rquickjs::Error::new_custom_error::<wasm::RuntimeError>(
                "RuntimeError".to_string(),
                "JS context has been dropped".to_string(),
            ));
        }

        self.js.ctx_ref -= 1;

        if self.js.ctx_ref == 0 {
            self.js.ctx = None;
        }

        Ok(())
    }

    fn init_ctx(&mut self, ctx: rquickjs::Ctx) -> rquickjs::Result<()> {
        self.js.ctx = Some(ContextWrapper::new(Context::from_ctx(ctx)?));
        self.js.ctx_ref = 1;

        Ok(())
    }

    pub fn insert_impfunc<'js>(
        &mut self, 
        ctx: rquickjs::Ctx<'js>, 
        value: rquickjs::Value<'js>, 
        ty: FuncType, 
        module_name: String, 
        import_name: String,
		index: u32
    ) {
        let saved_value = Persistent::save(ctx, value);
        let func_val = JSValueHandle(Arc::new(saved_value));
        let impfunc = JSImpFunc {
            func_val,
            ty,
            module_name,
            import_name 
        };
        self.js.funcs.insert(index, impfunc);
    }

    pub fn get_impfunc(&self, index: u32) -> Option<&JSImpFunc> {
        self.js.funcs.get(&index)
    }
}

unsafe impl Send for State {}
unsafe impl Sync for State {}

impl rquickjs::HasRefs for State {
    fn mark_refs(&self, marker: &rquickjs::RefsMarker) {
        self.js.js_mem.mark_refs(marker);
		self.js.js_table.mark_refs(marker);
		self.js.captured_instanceref.mark_refs(marker);
		self.js.captured_externref.mark_refs(marker);
		self.js.js_global.mark_refs(marker);
        for impfunc in self.js.funcs.values() {
            impfunc.func_val.mark_refs(marker);
        }
    }
}
