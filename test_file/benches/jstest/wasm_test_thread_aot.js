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

var t1, t2
let kind = scriptArgs[1]
let len = parseInt(scriptArgs[2])
let thread_num = parseInt(scriptArgs[3])
if ((kind != "num" && kind != "arr" && kind != "str") || !len || !thread_num) {
	console.log(`usage: ${scriptArgs[0]} <test data kind> <test data length> <thread num>`)
	exit(0)
}
var instances = new Array()

const TOTAL_COUNT = 20000
const buf = read_file(`${root}/test_file/benches/performance.wasm`)

async function test() {
	t1 = new Date()
	for (let i = 0; i < thread_num; ++ i) {
		let ins = instances[i]
		for (let j = 0; j < TOTAL_COUNT; ++ j) {
			if (kind === "num") {
				await ins.exportsAsync.get_num(23333)
			} else if (kind === "arr") {
				let ptr = ins.exports.malloc(len * 4)
				await ins.exportsAsync.get_arr(ptr, len)
				ins.exports.free(ptr)
			} else if (kind === "str") {
				let ptr = ins.exports.malloc(len)
				await ins.exportsAsync.get_str(ptr, len)
				ins.exports.free(ptr)
			}
		}
	}
	t2 = new Date()
	console.log(`Time elapsed: ${(t2 - t1) / 1000}`)
}

async function start_test() {
	for (let i = 0; i < thread_num; ++ i) {
		let ins = instances[i]
		if (kind === "num") {
			await ins.exportsAsync.get_num(23333)
		} else if (kind === "arr") {
			let ptr = ins.exports.malloc(len * 4)
			await ins.exportsAsync.get_arr(ptr, len)
			ins.exports.free(ptr)
		} else if (kind === "str") {
			let ptr = ins.exports.malloc(len)
			await ins.exportsAsync.get_str(ptr, len)
			ins.exports.free(ptr)
		}
	}
}

async function test2() {
	t1 = new Date()
	for (let i = 0; i < TOTAL_COUNT * thread_num; ++ i) {
		let ins = instances[0]
		if (kind === "num") {
			await ins.exportsAsync.get_num(23333)
		} else if (kind === "arr") {
			ptr = ins.exports.malloc(len * 4)
			await ins.exportsAsync.get_arr(ptr, len)
			ins.exports.free(ptr)
		} else if (kind === "str") {
			ptr = ins.exports.malloc(len)
			await ins.exportsAsync.get_str(ptr, len)
			ins.exports.free(ptr)
		}
	}
	t2 = new Date()
	console.log(`Time elapsed: ${(t2 - t1) / 1000}`)
}

async function benchmark() {
	for (let i = 0; i < thread_num; ++ i) {
		const module = WebAssembly.load(`${root}/test_file/benches/performance.so`)
		let obj = new WebAssembly.Instance(module)
		obj.instance.exports._initialize()
		instances.push(obj.instance)
	}
	await start_test()
	await test()
	// await test2()
}

benchmark()
