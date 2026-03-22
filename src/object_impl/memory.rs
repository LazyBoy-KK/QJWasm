use std::{sync::Arc, mem::ManuallyDrop};

use crate::{
    wasm::Memory,
    ENGINE
};
use rquickjs::{Error, Result};
use runtime::{VMMemoryInstance, MemoryType, VMRawMemoryInstance};

pub struct MemoryWrapper(ManuallyDrop<VMMemoryInstance>);

impl Drop for MemoryWrapper {
    fn drop(&mut self) {
        match self.0.raw {
            VMRawMemoryInstance::Defined(_) => {}
            _ => unsafe {
                ManuallyDrop::take(&mut self.0).drop_manually(&ENGINE);
            }
        }
    }
}

// Reference count of memory is managed individually since that JS ArrayBuffer
// interoperates with memory directly
#[derive(Clone)]
pub struct MemoryRefManager(Arc<MemoryWrapper>);

impl MemoryRefManager {
    pub fn new(memory: VMMemoryInstance) -> Self {
        Self(Arc::new(MemoryWrapper(ManuallyDrop::new(memory))))
    }
}

impl Memory {
    pub fn get_memory_buffer(&self) -> (*const u8, usize) {
        let data = self.inner.0.as_ref().0.data();
        let ptr = data.as_ptr();
        let len = data.len();
        (ptr, len)
    }

    pub fn ty(&self) -> MemoryType {
        self.inner.0.as_ref().0.ty()
    }

    pub fn get_raw_memory(&self) -> &VMRawMemoryInstance {
        &self.inner.0.as_ref().0.raw
    }

	pub fn convert_to_import(&self) -> VMRawMemoryInstance {
		unsafe {
			self.inner.0.as_ref().0.convert_ref_to_import()
		}
	}

    pub fn grow_memory(&self, delta: u32) -> Result<u32> {
        unsafe {
            self.inner.0.as_ref().0
                .grow(&ENGINE, delta)
                .map_err(|e| Error::new_range_error(e.to_string()))
        }
    }

    pub fn detach_buffer(&mut self, ctx: rquickjs::Ctx) -> Result<()> {
        if let Some(value) = self.buffer_cache.get_own_value() {
            let mut buffer = rquickjs::ArrayBuffer::from_value(value.restore(ctx)?)?;
            buffer.detach();
        }
        Ok(())
    }
}

impl rquickjs::HasRefs for Memory {
    fn mark_refs(&self, marker: &rquickjs::RefsMarker) {
        self.buffer_cache.mark_refs(marker);
    }
}

impl rquickjs::DeepSizeOf for Memory {}
