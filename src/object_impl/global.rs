use std::{cell::UnsafeCell, mem::ManuallyDrop};

use runtime::{VMGlobalInstance, GlobalType};
use crate::{INSTANCE_REF_MAP, RefCapture, SavedValue, map_wasm_to_js, object_impl::utils::SharedSafeGuard, wasm::{Global, RuntimeError}};
use rquickjs::{IntoJs, Object, Persistent, Result};

impl rquickjs::DeepSizeOf for Global {}

pub struct MutGlobal {
    pub(crate) inner: UnsafeCell<ManuallyDrop<VMGlobalInstance>>,
    pub(crate) ty: GlobalType,
    // keep instance for GC
	pub(crate) instance_ref: SavedValue,
	pub(crate) cache: SavedValue,
	pub(crate) ref_cap: Option<RefCapture>,
	pub(crate) safeguard: SharedSafeGuard,
}

impl Global {
    pub fn get_mutability(value: rquickjs::Value) -> Result<runtime::Mutability> {
        if let Some(mutibility) = value.as_bool() {
            match mutibility {
                true => Ok(runtime::Mutability::Var),
                false => Ok(runtime::Mutability::Const),
            }
        } else if let Some(mut_str) = value.as_string() {
            match mut_str.to_string()?.is_empty() {
                true => Ok(runtime::Mutability::Const),
                false => Ok(runtime::Mutability::Var),
            }
        } else if let Some(num) = value.as_number() {
            match num > 0.0f64 {
                true => Ok(runtime::Mutability::Var),
                false => Ok(runtime::Mutability::Const),
            }
        } else if value.is_undefined() || value.is_null() {
            Ok(runtime::Mutability::Const)
        } else {
            Err(rquickjs::Error::new_from_js("Value", "bool"))
        }
    }

    pub fn get_ty(&self) -> GlobalType {
        match self {
            Global::Mut(g) => g.ty.clone(),
            Global::Const(g) => g.ty.clone()
        }
    }

    pub fn get_global_type_obj<'js>(
        &self,
        ctx: rquickjs::Ctx<'js>,
        ty: runtime::GlobalType,
    ) -> Result<Object<'js>> {
        let obj = Object::new(ctx)?;
        let value = match ty.content() {
            runtime::ValType::I32 => "i32",
            runtime::ValType::I64 => "i64",
            runtime::ValType::F32 => "f32",
            runtime::ValType::F64 => "f64",
            runtime::ValType::Ref(runtime::RefType::FUNCREF) => "funcref",
            runtime::ValType::Ref(runtime::RefType::EXTERNREF) => "externref",
            _ => unreachable!(),
        };
        let mutable = match ty.mutability() {
            runtime::Mutability::Const => false,
            runtime::Mutability::Var => true,
        };
        obj.set("mutable", mutable)?;
        obj.set("value", value)?;
        Ok(obj)
    }

	pub fn get_impl<'js>(&mut self, ctx: rquickjs::Ctx<'js>) -> Result<rquickjs::Value<'js>> {
		match self {
			Global::Mut(g) => {
				if g.safeguard.get() {
					return Ok(rquickjs::Value::new_undefined(ctx));
				}
				let val = g.get_inner_mut().get();
				if g.ty.content() == runtime::ValType::Ref(runtime::RefType::FUNCREF) {
					let funcref = val.funcref().unwrap();
					if let Some(funcref) = funcref {
						let funcref = unsafe { funcref.as_ref() };
						if let Some(value) = g.cache.get_value() {
							let value = value.restore(ctx)?;
							let js_func = value.as_function().unwrap();
							let func = js_func.get_func_opaque::<crate::wasm::Function, u8, u8>()?;
							if func.inner.is_same_func(&funcref) {
								return Ok(value);
							}
						}
						let instance_ref = unsafe {
							INSTANCE_REF_MAP.with(|map| {
								map.borrow().get_value(ctx, &(funcref.caller as usize)).unwrap()
							})
						};
						let func = crate::wasm::Function {
							inner: funcref.clone(),
							instance_ref: SavedValue::new(Persistent::save(ctx, instance_ref)),
							is_async: false
						};
						func.into_js(ctx)
					} else {
						Ok(rquickjs::Value::new_null(ctx))
					}
				} else if g.ty.content() == runtime::ValType::Ref(runtime::RefType::EXTERNREF) {
					let externref = val.externref().unwrap();
					if let Some(externref) = externref {
						let ptr = externref.data();
						let externref = unsafe {
							(ptr as *const Persistent<rquickjs::Value<'static>>)
								.as_ref()
								.unwrap()
						};
						if let Some(value) = g.cache.get_value() {
							if &value == externref {
								return value.restore(ctx);
							}
						}
						g.cache.set_value(externref.clone());
						externref.clone().restore(ctx)
					} else {
						Ok(rquickjs::Value::new_undefined(ctx))
					}
				} else {
					map_wasm_to_js(ctx, &val)
				}
			}
			Global::Const(g) => {
				if g.ty.content() == runtime::ValType::Ref(runtime::RefType::FUNCREF) {
					let funcref = g.inner.get().funcref().unwrap();
					if let Some(funcref) = funcref {
						crate::wasm::Function {
							inner: unsafe { funcref.as_ref().clone() },
							instance_ref: g.instance_ref.clone(),
							is_async: false
						}.into_js(ctx)
					} else {
						Ok(rquickjs::Value::new_null(ctx))
					}
				} else if g.ty.content() == runtime::ValType::Ref(runtime::RefType::EXTERNREF) {
					let externref = g.inner.get().externref().unwrap();
					if let Some(externref) = externref {
						let ptr = externref.data();
						unsafe {
							(&(ptr as *const Persistent<rquickjs::Value<'static>>)
								.read())
								.clone()
								.restore(ctx)
						}
					} else {
						Ok(rquickjs::Value::new_undefined(ctx))
					}
				} else {
					map_wasm_to_js(ctx, &g.inner.get())
				}
			}
		}
	}

    pub fn set_impl<'js>(&mut self, ctx: rquickjs::Ctx<'js>, val: runtime::Val, js_val: rquickjs::Value<'js>) -> Result<()> {
        match self {
            Global::Mut(g) => {
				if g.safeguard.get() {
					return Err(rquickjs::Error::new_custom_error::<RuntimeError>(
						"RuntimeError".to_string(), 
						"safeguard violated".to_string()
					));
				}
				if g.ty.content().is_reference_type() {
					g.cache.set_value(Persistent::save(ctx, js_val.clone()));
				}
				g.get_inner_mut()
					.set(val)
					.map_err(|e| rquickjs::Error::new_type_error(e.to_string()))
			}
            Global::Const(_) => unreachable!()
        }
    }
}

impl MutGlobal {
    pub fn get_inner_mut(&self) -> &mut runtime::VMGlobalInstance {
        unsafe { &mut *self.inner.get() }
    }
}

impl Drop for Global {
    fn drop(&mut self) {
        if let Global::Mut(g) = self {
            if !g.instance_ref.has_value() {
                unsafe { ManuallyDrop::take(g.inner.get_mut()).drop_manually() }
            }
        }
    }
}

// TODO: impl rquickjs::HasRefs for global with ExternRef
impl rquickjs::HasRefs for Global {
    fn mark_refs(&self, marker: &rquickjs::RefsMarker) {
		match self {
			Global::Mut(g) => {
				g.cache.mark_refs(marker);
				g.instance_ref.mark_refs(marker);
				g.ref_cap.mark_refs(marker);
			}
			Global::Const(g) => g.instance_ref.mark_refs(marker),
		}
    }
}

pub struct ConstGlobal {
    pub(crate) inner: VMGlobalInstance,
    pub(crate) ty: GlobalType,
	pub(crate) instance_ref: SavedValue,
}
