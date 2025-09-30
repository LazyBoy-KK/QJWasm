import { getcwd, Worker } from "os"
import * as os from "os"

const parent = Worker.parent

const [root, err] = getcwd()
if (err) {
    throw Error(`can't get current working directory`)
}

function read_file(file) {
    const [fstat, fstatErr] = os.stat(file)
    if (fstatErr) {
        console.log("wasm file not found, ", fstatErr)
        throw ""
    }
    const fileSize = fstat.size

    const fd = os.open(file, os.O_RDONLY)
    if (fd < 0) {
        throw Error("open file error.\n")
    }
    const wasmBytes = new ArrayBuffer(fileSize)
    if (os.read(fd, wasmBytes, 0, fileSize) < 0) {
        throw Error("read file error.\n")
    }
    os.close(fd)
    return wasmBytes
}

const buf = read_file(`${root}/test_file/benches/performance.wasm`)

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
    const module = new WebAssembly.Module(buf)
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
