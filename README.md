# quikcjs-wasm

## WARNING: temporarily close-sourced wasm runtime

The WebAssembly runtime, WA2X, that used in QJWasm is temporarily close-sourced. It is developed by our laboratory and the related paper is still in progress. Therefore, the QJWasm can not be compiled until the WA2X has been published.

## Requirement

* Rust nightly: `rustup default nightly`
* LLVM 18

## Compile

Compile:

```shell
# Compile in debug mode
cargo build
# Compile in release mode
cargo build --release
```

Run:

```shell
target/release/quickjs-wasm path/to/js
```

## Test

### Test WPT wasm/jsapi

Must be compiled in external-aot or jit mode

```shell
path/to/quickjs-wasm test_file/runtest.js > new.md
```

The current result of WPT test is at `test.md`

```shell
# Run single test file
path/to/quickjs-wasm test_file/run.js test_file/jsapi/error-interfaces-no-symbol-tostringtag.any.js
```

### Performance test

Must be compiled without external-aot and jit mode when running on qemu arm cortex-a9 or lichee zero.

Compile wasm modules to AOT file:

```shell
cd test_file/benches
./compile_aot.sh
```

Run application benchmark:

```shell
cd test_file/benches/app_dir
path/to/quickjs-wasm test_file.js
```

Run inter-thread invocation benchmark:

```shell
# worker
path/to/quickjs-wasm test_file/benches/jstest/qjs_test_aot.js data_type length
# wasm async
path/to/quickjs-wasm test_file/benches/jstest/wasm_test_aot.js data_type length
```
