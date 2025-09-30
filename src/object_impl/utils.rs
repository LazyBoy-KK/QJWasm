use std::{collections::{HashMap, HashSet}, ptr::NonNull};
use rquickjs::{Array, IntoJs, Persistent};
use runtime::{CustomExternRef, ValRaw, ValType};

use crate::INSTANCE_REF_MAP;

use super::store::State;

#[derive(Clone, Default)]
pub struct SavedValue(Option<Persistent<rquickjs::Value<'static>>>);

impl SavedValue {
    pub fn new(persist: Persistent<rquickjs::Value<'static>>) -> Self {
        Self(Some(persist))
    }

    pub fn get_value(&self) -> Option<Persistent<rquickjs::Value<'static>>> {
        self.0.clone()
    }

    pub fn set_value(&mut self, value: Persistent<rquickjs::Value<'static>>) {
        self.0 = Some(value);
    }

    pub fn get_own_value(&mut self) -> Option<Persistent<rquickjs::Value<'static>>> {
        self.0.take()
    }

	pub fn has_value(&self) -> bool {
		self.0.is_some()
	}
}

impl rquickjs::HasRefs for SavedValue {
    fn mark_refs(&self, marker: &rquickjs::RefsMarker) {
        self.0.mark_refs(marker);
    }
}

pub struct SendSlices<'a, T>(pub &'a mut [T]);
unsafe impl<'a, T> Send for SendSlices<'a, T> {}

/// https://webassembly.github.io/spec/js-api/#string-value-of-the-extern-type
pub fn string_value_of_extern(ty: &runtime::ExternType) -> &'static str {
    use runtime::ExternType;
    match ty {
        ExternType::Global(_) => "global",
        ExternType::Func(_) => "function",
        ExternType::Table(_) => "table",
        ExternType::Memory(_) => "memory",
    }
}

// get content in object by calling js function such as `valueOf` or `toString` 
fn get_obj_content<'js>(
    ctx: rquickjs::Ctx<'js>,
    obj: &rquickjs::Object<'js>,
    key: &str,
) -> rquickjs::Result<rquickjs::Value<'js>> {
    let func: rquickjs::Function = obj.get(key)?;
    let mut call_input = rquickjs::CallInput::new(ctx, 0);
    call_input.this(obj.clone())?;
    func.call_raw(&call_input)
}

pub fn convert_js_value_to_uint<'js>(
    ctx: rquickjs::Ctx<'js>,
    value: rquickjs::Value<'js>,
) -> rquickjs::Result<u32> {
    let value = if let Some(obj) = value.as_object() {
        get_obj_content(ctx, obj, "valueOf")?
    } else {
        value
    };
    let num = value
        .as_int()
        .ok_or_else(|| rquickjs::Error::new_from_js("Value", "positive int"))?;
    if num < 0 {
        Err(rquickjs::Error::new_from_js("Value", "positive int"))
    } else {
        Ok(num as u32)
    }
}

pub fn map_js_to_u32<'js>(
    ctx: rquickjs::Ctx<'js>,
    value: rquickjs::Value<'js>,
) -> rquickjs::Result<Option<u32>> {
    let value = if let Some(obj) = value.as_object() {
        get_obj_content(ctx, obj, "valueOf")?
    } else {
        value
    };
    if value.is_undefined() || value.is_null() {
        Ok(None)
    } else {
        let num = value
            .as_int()
            .ok_or_else(|| rquickjs::Error::new_from_js("Value", "int"))?;
        if num < 0 {
            Err(rquickjs::Error::new_from_js("Value", "int"))
        } else {
            Ok(Some(num as u32))
        }
    }
}

pub fn map_js_to_rust_str<'js>(
    ctx: rquickjs::Ctx<'js>,
    value: rquickjs::Value<'js>,
) -> rquickjs::Result<String> {
    let value = if let Some(obj) = value.as_object() {
        get_obj_content(ctx, obj, "toString")?
    } else {
        value
    };
    let js_str = value
        .into_string()
        .ok_or_else(|| rquickjs::Error::new_from_js("Value", "String"))?;
    js_str.to_string()
}

fn map_js_to_wasm_inner<'js>(
	ctx: rquickjs::Ctx<'js>,
    value: &rquickjs::Value<'js>,
    val_type: &runtime::ValType,
    enable_bool: bool,
    enable_void: bool,
	ref_capture: &mut Option<&mut RefCapture>,
) -> rquickjs::Result<runtime::Val> {
    match val_type {
        runtime::ValType::I32 => {
            if let Some(num) = value.as_int() {
                Ok(runtime::Val::I32(num))
            } else if let Some(num) = value.as_number() {
				if num.fract() == 0.0 {
					Ok(runtime::Val::I32(num as i32))
				} else {
					Err(rquickjs::Error::new_from_js("Value", "i32"))
				}
			} else if enable_bool && value.as_bool().is_some() {
                let num = value.as_bool().unwrap();
                Ok(runtime::Val::I32(num as _))
            } else if enable_void && (value.is_undefined() || value.is_null()) {
                Ok(runtime::Val::I32(0))
            } else {
                value.as_string().map_or_else(
                    || Err(rquickjs::Error::new_from_js("Value", "i32")),
                    |js_str| {
                        Ok(runtime::Val::I32(
                            js_str
                                .to_string()?
                                .parse::<i32>()
                                .map_err(|_| rquickjs::Error::new_from_js("Value", "i32"))?,
                        ))
                    },
                )
            }
        }
        runtime::ValType::I64 => {
            if let Some(num) = value.as_big_int() {
                Ok(runtime::Val::I64(num.clone().to_i64()?))
            } else if enable_bool && value.as_bool().is_some() {
                let num = value.as_bool().unwrap();
                Ok(runtime::Val::I64(num as _))
            } else if enable_void && value.is_undefined() {
                Ok(runtime::Val::I64(0))
            } else {
                value.as_string().map_or_else(
                    || Err(rquickjs::Error::new_from_js("Value", "i64")),
                    |js_str| {
                        Ok(runtime::Val::I64(
                            js_str
                                .to_string()?
                                .parse::<i64>()
                                .map_err(|_| rquickjs::Error::new_from_js("Value", "i64"))?,
                        ))
                    },
                )
            }
        }
        runtime::ValType::F32 => {
            if let Some(num) = value.as_number() {
                return Ok(runtime::Val::F32(num as f32));
            } else if enable_bool && value.as_bool().is_some() {
                let num = value.as_bool().unwrap();
                Ok(runtime::Val::F32(num as i32 as f32))
            } else if enable_void && (value.is_undefined() || value.is_null()) {
                Ok(runtime::Val::F32(0.0f32))
            } else {
                value.as_string().map_or_else(
                    || Err(rquickjs::Error::new_from_js("Value", "f32")),
                    |js_str| {
                        Ok(runtime::Val::F32(
                            js_str
                                .to_string()?
                                .parse::<f32>()
                                .map_err(|_| rquickjs::Error::new_from_js("Value", "f32"))?
                        ))
                    },
                )
            }
        }
        runtime::ValType::F64 => {
            if let Some(num) = value.as_number() {
                Ok(runtime::Val::F64(num))
            } else if enable_bool && value.as_bool().is_some() {
                let num = value.as_bool().unwrap();
                Ok(runtime::Val::F64(num as i32 as f64))
            } else if enable_void && (value.is_undefined() || value.is_null()) {
                Ok(runtime::Val::F64(0.0f64))
            } else {
                value.as_string().map_or_else(
                    || Err(rquickjs::Error::new_from_js("Value", "f64")),
                    |js_str| {
                        Ok(runtime::Val::F64(
                            js_str
                                .to_string()?
                                .parse::<f64>()
                                .map_err(|_| rquickjs::Error::new_from_js("Value", "f64"))?
                        ))
                    },
                )
            }
        }
		runtime::ValType::Ref(runtime::RefType::FUNCREF) => {
			if value.is_null() {
				Ok(runtime::Val::FuncRef(None))
			} else {
				let js_func = value.as_function().ok_or_else(|| {
					rquickjs::Error::new_from_js("Value", "funcref")
				})?;
				let func = js_func.get_mut_func_opaque::<crate::wasm::Function, u8, u8>()?;
				if let Some(ref_cap) = ref_capture {
					if let Some(persist) = func.instance_ref.get_value() {
						ref_cap.insert_instanceref(func.inner.caller as _, persist);
					}
				}
				Ok(runtime::Val::FuncRef(NonNull::new(&mut func.inner)))
			}
		}
		runtime::ValType::Ref(runtime::RefType::EXTERNREF) => {
			if value.is_null() {
				Ok(runtime::Val::ExternRef(None))
			} else {
				let persist = Persistent::save(ctx, value.clone());
				let ptr = ref_capture.as_mut().unwrap().insert_externref(persist).unwrap();
				Ok(runtime::Val::ExternRef(Some(CustomExternRef::new(ptr))))
			}
		}
		_ => unreachable!()
    }
}

pub fn map_js_to_wasm<'js>(
    ctx: rquickjs::Ctx<'js>,
    v: rquickjs::Value<'js>,
    val_type: runtime::ValType,
    enable_bool: bool,
    enable_void: bool,
	mut ref_capture: Option<&mut RefCapture>
) -> rquickjs::Result<runtime::Val> {
    if let Some(obj) = v.as_object() {
        let res1 = get_obj_content(ctx, obj, "valueOf")
            .and_then(|value| map_js_to_wasm_inner(ctx, &value, &val_type, enable_bool, enable_void, &mut ref_capture));
        let res2 = get_obj_content(ctx, obj, "toString")
            .and_then(|value| map_js_to_wasm_inner(ctx, &value, &val_type, enable_bool, enable_void, &mut ref_capture));

        if res1.is_ok() {
            res1
        } else if res2.is_ok() {
            res2
        } else {
            Err(rquickjs::Error::new_type_error(format!(
                "Error converting from js Value into type {val_type}"
            )))
        }
    } else {
        map_js_to_wasm_inner(ctx, &v, &val_type, enable_bool, enable_void, &mut ref_capture)
    }
}

pub fn get_optional(optional: rquickjs::Rest<rquickjs::Value>) -> Option<rquickjs::Value> {
    let mut inner = optional.into_inner();
    if inner.is_empty() {
        None
    } else {
        Some(inner.swap_remove(0))
    }
}

#[macro_export]
macro_rules! saved_buffer {
    (($($ty: ty),*), $val: ident) => {
        {
            use rquickjs::*;
            if let Ok(b) = ArrayBuffer::from_value($val.clone()) {
                let buf: &[u8] = b.as_ref();
                unsafe { std::mem::transmute(buf) }
            } $( else if let Ok(b) = TypedArray::<$ty>::from_value($val.clone()) {
                    let buf: &[$ty] = b.as_ref();
                    let (_, buf, _) = unsafe { buf.align_to::<u8>() };
                    unsafe { std::mem::transmute(buf) }
                }
            )* else {
                return Err(rquickjs::Error::new_from_js(
                    "Object",
                    "ArrayBuffer or TypedArray",
                ));
            }
        }
    };
}

macro_rules! get_buffer {
    (($($ty: ty),*), $val: ident, $f: ident) => {
        {
            use rquickjs::*;
            if let Ok(b) = ArrayBuffer::from_value($val.clone()) {
                let buf: &[u8] = b.as_ref();
                Ok($f(buf))
            } $( else if let Ok(b) = TypedArray::<$ty>::from_value($val.clone()) {
                    let buf: &[$ty] = b.as_ref();
                    let (_, buf, _) = unsafe { buf.align_to::<u8>() };
                    Ok($f(buf))
                }
            )* else {
                return Err(rquickjs::Error::new_from_js(
                    "Object",
                    "ArrayBuffer or TypedArray",
                ));
            }
        }
    };
}

pub fn get_arraybuffer_from_value<'js, F, R>(
    buffer: rquickjs::Value<'js>,
    f: F,
) -> rquickjs::Result<R>
where
    F: Fn(&[u8]) -> R,
{
    get_buffer!((i8, u8, i16, u16, i32, u32), buffer, f)
}

pub fn map_wasm_to_js<'js>(
    ctx: rquickjs::Ctx<'js>,
    val: &runtime::Val,
) -> rquickjs::Result<rquickjs::Value<'js>> {
    use runtime::Val;
    match val {
        Val::I32(v) => v.into_js(ctx),
        Val::I64(v) => rquickjs::BigInt::from_i64(ctx, *v).into_js(ctx),
        Val::F32(v) => v.into_js(ctx),
        Val::F64(v) => v.into_js(ctx),
		Val::ExternRef(v) => {
			if let Some(v) = v {
				let ptr = v.data();
				if ptr == 0 {
					Ok(rquickjs::Value::new_null(ctx))
				} else {
					unsafe {
						(&(ptr as *const Persistent<rquickjs::Value<'static>>)
							.read())
							.clone()
							.restore(ctx)
					}
				}
			} else {
				Ok(rquickjs::Value::new_null(ctx))
			}
		}
		_ => unreachable!(),
    }
}

pub fn clone_error(err: &rquickjs::Error) -> Option<rquickjs::Error> {
    use rquickjs::Error;
    match err {
        Error::Allocation => Some(Error::Allocation),
        Error::InvalidString(e) => Some(Error::InvalidString(e.clone())),
        Error::Utf8(e) => Some(Error::Utf8(e.clone())),
        Error::Exception {
            message,
            file,
            line,
            stack,
        } => Some(Error::Exception {
            message: message.clone(),
            file: file.clone(),
            line: line.clone(),
            stack: stack.clone(),
        }),
        Error::FromJs { from, to, message } => Some(Error::FromJs {
            from,
            to,
            message: message.clone(),
        }),
        Error::IntoJs { from, to, message } => Some(Error::IntoJs {
            from,
            to,
            message: message.clone(),
        }),
        Error::CustomError {
            name,
            class_name,
            message,
        } => Some(Error::CustomError {
            name: name.clone(),
            class_name: class_name.clone(),
            message: message.clone(),
        }),
        Error::TypeError { message } => Some(Error::TypeError {
            message: message.clone(),
        }),
        Error::UnrelatedRuntime => Some(Error::UnrelatedRuntime),
        Error::Unknown => Some(Error::Unknown),
        _ => None,
    }
}

fn map_wasm_raw_to_js<'js>(ctx: rquickjs::Ctx<'js>, val: &ValRaw, ty: &ValType) -> rquickjs::Result<rquickjs::Value<'js>> {
    match ty {
        ValType::I32 => val.get_i32_unchecked().into_js(ctx),
        ValType::I64 => rquickjs::BigInt::from_i64(ctx, val.get_i64_unchecked()).into_js(ctx),
        ValType::F32 => val.get_f32_unchecked().into_js(ctx),
        ValType::F64 => val.get_f64_unchecked().into_js(ctx),
		ValType::Ref(runtime::RefType::FUNCREF) => {
			let funcref = val.get_funcref_unchecked();
			if let Some(funcref) = funcref {
				let func = unsafe { funcref.as_ref().clone() };
				let instance_ref = unsafe {
					INSTANCE_REF_MAP.with(|map| {
                        map.borrow().get_value(ctx, &(func.caller as usize)).unwrap()
                    })
				};
				let func = crate::wasm::Function {
					inner: func,
					instance_ref: SavedValue::new(Persistent::save(ctx, instance_ref)),
					is_async: false
				};
				func.into_js(ctx)
			} else {
				Ok(rquickjs::Value::new_null(ctx))
			}
		}
		ValType::Ref(runtime::RefType::EXTERNREF) => {
			let externref = val.get_externref_unchecked();
			if let Some(externref) = externref.0 {
				let ptr = externref.get();
				unsafe {
					(&(ptr as *const Persistent<rquickjs::Value<'static>>)
						.read())
						.clone()
						.restore(ctx)
				}
			} else {
				Ok(rquickjs::Value::new_null(ctx))
			}
		}
        _ => unreachable!()
    }
}

pub fn call_func<'js>(
    ctx: rquickjs::Ctx<'js>,
    func: rquickjs::Function<'js>,
	state_inner: &mut State,
    func_ty: &runtime::FuncType,
    module_name: &str,
    import_name: &str,
    val_raw: &mut [ValRaw]
) -> rquickjs::Result<()> {
    let mut call_input = rquickjs::CallInput::new(ctx, func_ty.params().len());
    for (param_ty, raw) in func_ty.params().iter().zip(val_raw.iter()) {
        let val = map_wasm_raw_to_js(ctx, raw, param_ty)?;
        call_input.arg(val)?;
    }
    let val = func.call_raw(&call_input)?;
    match func_ty.results().len() {
        0 => Ok(()),
        1 => {
			let val_type = func_ty.results()[0];
			let ref_cap = if val_type == runtime::ValType::Ref(runtime::RefType::FUNCREF) {
				Some(state_inner.instanceref_cap())
			} else if val_type == runtime::ValType::Ref(runtime::RefType::EXTERNREF) {
				Some(state_inner.externref_cap())
			} else {
				None
			};
			let wasm_val = map_js_to_wasm(
				ctx, 
				val, 
				func_ty.results()[0], 
				false, 
				false, 
				ref_cap
			)?;
			val_raw[0] = wasm_val.into_raw();
            
            Ok(())
        }
        _ => {
			let js_arr = if let Some(obj) = val.clone().into_object() {
				Array::from_iter_obj(obj)?
			} else if let Some(js_arr) = val.into_array() {
				js_arr
			} else {
				return Err(rquickjs::Error::new_from_js("Value", "array-like-object"))
			};
			for (i, val_type) in func_ty.results().iter().enumerate() {
				let value = js_arr.get::<rquickjs::Value>(i)?;
				let ref_cap = if val_type == &runtime::ValType::Ref(runtime::RefType::FUNCREF) {
					Some(state_inner.instanceref_cap())
				} else if val_type == &runtime::ValType::Ref(runtime::RefType::EXTERNREF) {
					Some(state_inner.externref_cap())
				} else {
					None
				};
				let wasm_val = map_js_to_wasm(
					ctx, 
					value, 
					val_type.clone(), 
					false, 
					false, 
					ref_cap
				)?;
				val_raw[i] = wasm_val.into_raw();
			}
			Ok(())
		}
    }
}

pub enum RefCapture {
	FuncRef(HashMap<usize, Persistent<rquickjs::Value<'static>>>),
	ExternRef(HashSet<Persistent<rquickjs::Value<'static>>>),
}

impl rquickjs::DeepSizeOf for RefCapture {
	fn deep_size_of_children(&self, _context: &mut rquickjs::DeepSizeCtx) -> usize {
		match self {
			Self::FuncRef(map) => map.capacity() * size_of::<(usize, Persistent<rquickjs::Value<'static>>)>(),
			Self::ExternRef(s) => s.capacity() * size_of::<Persistent<rquickjs::Value<'static>>>(),
		}
	}
}

impl RefCapture {
	pub fn new(ty: ValType) -> Option<Self> {
		match ty {
			ValType::Ref(runtime::RefType::FUNCREF) => Some(Self::FuncRef(HashMap::new())),
			ValType::Ref(runtime::RefType::EXTERNREF) => Some(Self::ExternRef(HashSet::new())),
			_ => None
		}
	}

	pub fn insert_instanceref(&mut self, caller: usize, instance: Persistent<rquickjs::Value<'static>>) {
		match self {
			Self::FuncRef(map) => { map.insert(caller, instance); }
			_ => {}
		}
	}

	pub fn insert_externref(&mut self, value: Persistent<rquickjs::Value<'static>>) -> Option<usize> {
		match self {
			Self::ExternRef(set) => {
				Some(set.get_or_insert(value) as *const Persistent<rquickjs::Value<'static>> as _)
			}
			_ => None
		}
	}
}

impl rquickjs::HasRefs for RefCapture {
	fn mark_refs(&self, marker: &rquickjs::RefsMarker) {
		match self {
			Self::FuncRef(map) => map.mark_refs(marker),
			Self::ExternRef(set) => set.mark_refs(marker),
		}
	}
}

unsafe impl Send for RefCapture {}
unsafe impl Sync for RefCapture {}
