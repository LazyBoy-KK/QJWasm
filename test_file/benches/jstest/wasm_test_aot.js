import * as os from "os"
import { exit } from "std"

const [root, err] = os.getcwd()
if (err) {
    throw Error(`can't get current working directory`)
}

var t1, t2, ptr
let kind = scriptArgs[1]
let len = parseInt(scriptArgs[2])
if ((kind != "num" && kind != "arr" && kind != "str") || !len) {
	console.log(`usage: ${scriptArgs[0]} <test data kind> <test data length>`)
	exit(0)
}

const TOTAL_COUNT = 20000

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

async function start_thread() {
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

async function benchmark() {
	await start_thread()
	await test()
}

const module = WebAssembly.load(`${root}/test_file/benches/performance.so`)
const instance = new WebAssembly.Instance(module)
globalThis.malloc = instance.exports.malloc
globalThis.free = instance.exports.free
globalThis.test_num = instance.exportsAsync.get_num
globalThis.test_arr = instance.exportsAsync.get_arr
globalThis.test_str = instance.exportsAsync.get_str
benchmark()
