use std::path::PathBuf;

use crate::wasm;
use rquickjs::{Error, Result, DeepSizeCtx};

pub struct ModuleWrapper {
    inner: runtime::Module
}

impl rquickjs::DeepSizeOf for ModuleWrapper {
	fn deep_size_of_children(&self, _context: &mut DeepSizeCtx) -> usize {
		self.inner.metadata().customs.capacity() * size_of::<runtime::CustomSection>() +
		self.inner.metadata().datas.capacity() * size_of::<runtime::DataItem>() +
		self.inner.metadata().elems.capacity() * size_of::<runtime::ElementItem>() +
		self.inner.metadata().export2idx.capacity() * size_of::<(&str, u32)>() +
		self.inner.metadata().exports.capacity() * size_of::<runtime::ExportItem>() +
		self.inner.metadata().func_types.capacity() * size_of::<runtime::FuncType>() +
		self.inner.metadata().funcs.capacity() * size_of::<runtime::InternalFunc>() +
		self.inner.metadata().imports.capacity() * size_of::<runtime::ImportItem>()
	}
}

// Module will only be accessed in rust thread
unsafe impl Send for ModuleWrapper {}
unsafe impl Sync for ModuleWrapper {}

impl ModuleWrapper {
    pub fn get_inner(&self) -> &runtime::Module {
        &self.inner
    }
}

impl rquickjs::DeepSizeOf for wasm::Module {
	fn deep_size_of_children(&self, context: &mut DeepSizeCtx) -> usize {
		let sum = self.inner.deep_size_of_children(context);
		sum
	}
}

impl wasm::Module {
    #[cfg(any(feature = "external-aot", feature = "jit"))]
    pub fn new_inner(buf: &[u8]) -> Result<Self> {
        match runtime::Module::new(&crate::ENGINE, buf) {
            Ok(m) => {
                Ok(wasm::Module {
                    inner: ModuleWrapper { inner: m },
                })
            }
            Err(e) => Err(Error::new_custom_error::<wasm::CompileError>(
                "CompileError".to_string(),
                e.to_string(),
            )),
        }
    }

    pub fn new_from_aot(path: PathBuf) -> Result<Self> {
        match unsafe { runtime::Module::from_aot_file(&crate::ENGINE, path) } {
            Ok(m) => {
                Ok(wasm::Module {
                    inner: ModuleWrapper { inner: m },
                })
            }
            Err(e) => {
                Err(Error::new_custom_error::<wasm::CompileError>(
                    "CompilerError".to_string(), 
                    e.to_string()
                ))
            }
        }
    }

    pub fn get_module(&self) -> &runtime::Module {
        self.inner.get_inner()
    }
}
