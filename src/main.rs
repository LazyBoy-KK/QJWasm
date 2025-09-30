use std::{ffi::CString, path::PathBuf};

#[cfg(feature = "quickjs-libc-test")]
use rquickjs::get_global_used_memory_size;
use quickjs_wasm::rquickjs::{EvalOptions, Context, Runtime};

fn main() {
	let js_file = std::env::args()
		.nth(1)
		.expect("first arg: js file");
    let runtime = Runtime::new().expect("runtime start failed");
    runtime.set_only_loader(rquickjs::ScriptLoader::default());
    let args = std::env::args()
		.skip(1)
        .map(|args| CString::new(args).expect("invalid c string"))
        .collect();
    let context = Context::full_with_libc(&runtime, Some(args)).expect("exec file failed");
	let ctx = rquickjs::Ctx::new(&context);
	let mut options = EvalOptions::default();
	options.global = false;
	ctx.eval_file_with_options_and_std_loop::<(), _>(PathBuf::from(js_file), options).unwrap();
	#[cfg(feature = "quickjs-libc-test")]
	println!("global memory used:{}", get_global_used_memory_size());
	#[cfg(feature = "max-rss")]
	unsafe {
		let mut usage: libc::rusage = std::mem::zeroed();
        let result = libc::getrusage(libc::RUSAGE_SELF, &mut usage);
        if result == 0 {
            println!("Max Resident Set Size (ru_maxrss): {} KB", usage.ru_maxrss);
        } else {
            eprintln!("Error calling getrusage");
        }
	}
}
