use std::num::NonZeroU64;

use crate::{
    object_impl::utils::SavedValue,
    wasm::{Function, Table}, INSTANCE_REF_MAP,
};
use rquickjs::{DeepSizeCtx, IntoJs, Persistent, Result, Value};
use runtime::{ExternRef, VMExternRef, VMFuncRef, VMRawTableInstance};

impl rquickjs::DeepSizeOf for Table {
	fn deep_size_of_children(&self, context: &mut DeepSizeCtx) -> usize {
		let sum1 = self.saved_vec.capacity() * size_of::<SavedValue>() +
			self.ref_cap.deep_size_of_children(context);
		let sum2 = match &self.inner.raw {
			VMRawTableInstance::FuncRefIndirect(t) => t.cap() * size_of::<VMFuncRef>(),
			VMRawTableInstance::ExternRefIndirect(t) => t.cap() * size_of::<ExternRef>(),
			_ => 0
		};
		sum1 + sum2
	}
}

impl Table {
    pub fn get_impl<'js>(&mut self, ctx: rquickjs::Ctx<'js>, index: u32) -> Result<Value<'js>> {
        let saved_vec = &mut self.saved_vec;
        if index >= saved_vec.len() as _ {
            return Err(rquickjs::Error::new_range_error(
                "Table index must be less than table length".to_string(),
            ));
        }
		let ref_value = self.inner.get(index).unwrap();
		match ref_value {
			runtime::Ref::FuncRef(funcref) => {
				let funcref = unsafe { runtime::Ref::to_func(funcref) };
				if !funcref.is_null() {
					if let Some(persist) = saved_vec[index as usize].get_value() {
						let value = persist.restore(ctx)?;
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
					let func = Function {
						inner: funcref,
						instance_ref: SavedValue::new(Persistent::save(ctx, instance_ref)),
						is_async: false,
					};
					let js_func = func.into_js(ctx)?;
					let persist = Persistent::save(ctx, js_func.clone());
					saved_vec[index as usize] = SavedValue::new(persist);
					Ok(js_func)
				} else {
					Ok(rquickjs::Value::new_null(ctx))
				}
			}
			runtime::Ref::ExternRef(externref) => {
				if let Some(externref) = externref.0 {
					let ptr = externref.get();
					let persist = unsafe {
						(ptr as *const Persistent<rquickjs::Value<'static>>)
							.as_ref()
							.unwrap()
							.clone()
					};
					if let Some(value) = saved_vec[index as usize].get_value() {
						if value == persist {
							return value.restore(ctx);
						}
					}
					saved_vec[index as usize] = SavedValue::new(persist.clone());
					persist.restore(ctx)
				} else {
					Ok(rquickjs::Value::new_undefined(ctx))
				}
			}
		}
    }

    pub fn set_impl<'js>(
        &mut self,
        ctx: rquickjs::Ctx<'js>,
        index: u32,
        value: Value<'js>,
    ) -> Result<()> {
        let saved_vec = &mut self.saved_vec;
        if index >= self.inner.size() {
            return Err(rquickjs::Error::new_range_error(
                "Table setting out of bound".to_string(),
            ));
        }
        if value.is_null() {
			match self.inner.ty().element() {
				runtime::RefType::FUNCREF => unsafe {
					self.inner.set_func(index, VMFuncRef::null());
				}
				runtime::RefType::EXTERNREF => unsafe {
					self.inner.set_externref(index, VMExternRef(None));
				}
				_ => unreachable!()
			}
            saved_vec[index as usize] = SavedValue::default();
        } else {
			match self.inner.ty().element() {
				runtime::RefType::FUNCREF => {
					let js_func = value
						.as_function()
						.ok_or_else(|| rquickjs::Error::new_from_js("Value", "funcref"))?;
					let func = js_func.get_func_opaque::<Function, u8, u8>()?;
					let func_ref = func.inner.clone();
					self.ref_cap.insert_instanceref(func.inner.caller as usize, func.instance_ref.get_value().unwrap());
					unsafe {
						self.inner.set_func(index, func_ref);
					}
					saved_vec[index as usize] = SavedValue::new(Persistent::save(ctx, value));
				}
				runtime::RefType::EXTERNREF => {
					let persist = Persistent::save(ctx, value);
					let ptr = self.ref_cap.insert_externref(persist.clone()).unwrap();
					unsafe {
						self.inner.set_externref(index, VMExternRef(Some(NonZeroU64::new(ptr as _).unwrap())));
					}
					saved_vec[index as usize] = SavedValue::new(persist);
				}
				_ => unreachable!()
			}
        }
        Ok(())
    }

    pub fn get_exported_func<'js>(value: &'js Value) -> Result<&'js Function> {
        let js_func = value.as_function().ok_or_else(|| {
            rquickjs::Error::new_type_error("Not a wasm exported function".to_string())
        })?;
        js_func.get_func_opaque::<Function, u8, u8>()
    }

    pub fn grow_impl<'js>(
        &mut self,
        ctx: rquickjs::Ctx<'js>,
        delta: u32,
        value: Value<'js>,
    ) -> Result<u32> {
        if self.inner.size() + delta > self.inner.maximum.map_or(u32::MAX, |n| n.get()) {
            return Err(rquickjs::Error::new_range_error(
                "Table growing out of bound".to_string(),
            ));
        }
        let res = if value.is_null() {
            let res = match &mut self.inner.raw {
                VMRawTableInstance::FuncRefIndirect(t) => t.grow(delta, VMFuncRef::null()),
                VMRawTableInstance::ExternRefIndirect(t) => t.grow(delta, VMExternRef(None)),
				_ => unreachable!()
            };
            self.saved_vec
                .resize(self.saved_vec.len() + delta as usize, SavedValue::default());
            res
        } else {
			match &mut self.inner.raw {
				VMRawTableInstance::FuncRefIndirect(t) => {
					let func = Self::get_exported_func(&value)?;
					self.ref_cap.insert_instanceref(func.inner.caller as _, func.instance_ref.get_value().unwrap());
            		let func_ref = func.inner.clone();
					self.saved_vec
                		.resize(self.saved_vec.len() + delta as usize, SavedValue::new(Persistent::save(ctx, value)));
					t.grow(delta, func_ref)
				}
				VMRawTableInstance::ExternRefIndirect(t) => {
					let persist = Persistent::save(ctx, value);
					let ptr = self.ref_cap.insert_externref(persist.clone()).unwrap();
					self.saved_vec
                		.resize(self.saved_vec.len() + delta as usize, SavedValue::new(persist));
					t.grow(delta, VMExternRef(Some(NonZeroU64::new(ptr as _).unwrap())))
				}
				_ => unreachable!()
			}
        };

		Ok(res)
    }
}

impl rquickjs::HasRefs for Table {
    fn mark_refs(&self, marker: &rquickjs::RefsMarker) {
        self.instance_ref.mark_refs(marker);
		self.ref_cap.mark_refs(marker);
        self.saved_vec.mark_refs(marker);
    }
}

impl Drop for Table {
    fn drop(&mut self) {
        if !self.instance_ref.has_value() {
            unsafe {
                self.inner.drop_manually();
            }
        }
    }
}
