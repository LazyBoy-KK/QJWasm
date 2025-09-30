import { getcwd, Worker } from "os"
import { exit } from "std"

const [root, err] = getcwd()
if (err) {
    throw Error(`can't get current working directory`)
}

var t1, t2
let kind = scriptArgs[1]
let len = parseInt(scriptArgs[2])
if ((kind != "num" && kind != "arr" && kind != "str") || !len) {
	console.log(`usage: ${scriptArgs[0]} <test data kind> <test data length>`)
	exit(0)
}

let obj;
if (kind == "num") {
	len = 1;
	obj = 23333;
} else if (kind == "arr") {
	obj = new Uint32Array(len)
} else if (kind == "str") {
	obj = new Uint8Array(len)
}

let worker = new Worker(`${root}/test_file/benches/jstest/qjs_worker.js`)
const TOTAL_COUNT = 20000
worker.onmessage = (_e) => {}

async function test() {
	t1 = new Date()
	for (let i = 0; i < TOTAL_COUNT; ++ i) {
		await new Promise(function(resolve, reject) {
			worker.onmessage = (e) => {
				resolve(e.data)
			}
			worker.postMessage(obj)
		})
	}
	t2 = new Date()
	console.log(`Elapsed time: ${(t2 - t1) / 1000}`)
}

test()
