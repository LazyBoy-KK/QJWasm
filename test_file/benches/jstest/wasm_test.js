import * as os from "os"
import { exit } from "std"

const [root, err] = os.getcwd()
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

var t1, t2, ptr
let kind = scriptArgs[1]
let len = parseInt(scriptArgs[2])
if ((kind != "num" && kind != "arr" && kind != "str") || !len) {
	console.log(`usage: ${scriptArgs[0]} <test data kind> <test data length>`)
	exit(0)
}

const TOTAL_COUNT = 200000
const buf = read_file(`${root}/test_file/benches/performance.wasm`)

async function test() {
	t1 = new Date()
	for (let i = 0; i < TOTAL_COUNT; ++ i) {
		if (kind === "num") {
			await test_num(23333)
		} else if (kind === "arr") {
			ptr = malloc(len * 4)
			await test_arr(ptr, len)
			free(ptr)
		} else if (kind === "str") {
			ptr = malloc(len)
			await test_str(ptr, len)
			free(ptr)
		}
	}
	t2 = new Date()
	console.log(`Time elapsed: ${(t2 - t1) / 1000}`)
}

WebAssembly.instantiate(buf).then(obj => {
	let instance = obj.instance
	globalThis.malloc = instance.exports.malloc
	globalThis.free = instance.exports.free
	globalThis.test_num = instance.exportsAsync.get_num
	globalThis.test_arr = instance.exportsAsync.get_arr
	globalThis.test_str = instance.exportsAsync.get_str
	test()
}).catch(e => console.log(e))
