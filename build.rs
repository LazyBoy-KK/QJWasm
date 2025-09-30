// Copyright (C) 2023 韩朴宇.  All rights reserved.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

use std::env::var;

fn main() {
    if var("CARGO_CFG_UNIX").is_ok() {
        if var("CARGO_CFG_TARGET_VENDOR") != Ok("apple".to_owned()) {
            println!(
                "cargo:rustc-link-arg=-Wl,--dynamic-list={}/../iwasm-rs/runtime/dynsyms_gnu.txt",
                std::env::var("CARGO_MANIFEST_DIR").unwrap()
            )
        } else {
            println!(
                "cargo:rustc-link-arg=-Wl,-exported_symbols_list,{}/../iwasm-rs/runtime/dynsyms_apple.txt",
                std::env::var("CARGO_MANIFEST_DIR").unwrap()
            )
        }
    }
}
