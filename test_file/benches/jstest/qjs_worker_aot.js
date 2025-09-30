import { getcwd, Worker } from "os"

const parent = Worker.parent

const [root, err] = getcwd()
if (err) {
    throw Error(`can't get current working directory`)
}

var ptr, len, res

function handle(e) {
	if (Number.isInteger(e.data)) {
		res = test_num(e.data)
		parent.postMessage(res)
	} else if (e.data instanceof Uint32Array) { // test arr
        len = e.data.length
        ptr = wasm_malloc(e.data.byteLength)
        let wasm = new Uint32Array(memory.buffer, ptr, len)
        wasm.set(e.data, 0)
        res = test_arr(ptr, len)
        wasm_free(ptr)
        parent.postMessage(res)
    } else if (e.data instanceof Uint8Array) {
		len = e.data.length
        ptr = wasm_malloc(e.data.byteLength)
        let wasm = new Uint8Array(memory.buffer, ptr, len)
        wasm.set(e.data, 0)
        res = test_str(ptr, len)
        wasm_free(ptr)
        parent.postMessage(res)
	} else { // destroy worker
        parent.onmessage = null
    }
}

function worker_main() {
    const module = WebAssembly.load(`${root}/test_file/benches/performance.so`)
    const instance = new WebAssembly.Instance(module)
    globalThis.memory = instance.exports.memory
    globalThis.test_arr = instance.exports.get_arr
	globalThis.test_num = instance.exports.get_num
	globalThis.test_str = instance.exports.get_str
    globalThis.wasm_malloc = instance.exports.malloc
    globalThis.wasm_free = instance.exports.free
    parent.onmessage = handle
    parent.postMessage(`ok`)
}

worker_main()
