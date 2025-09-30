import { getcwd, Worker } from "os"
import { exit } from "std"

const [root, err] = getcwd()
if (err) {
    throw Error(`can't get current working directory`)
}

var t1, t2
let kind = scriptArgs[1]
let len = parseInt(scriptArgs[2])
let thread_num = parseInt(scriptArgs[3])
if ((kind != "num" && kind != "arr" && kind != "str") || !len || !thread_num) {
	console.log(`usage: ${scriptArgs[0]} <test data kind> <test data length> <thread num>`)
	exit(0)
}
let resolveArr = new Array()
let workerNow = new Uint32Array(thread_num)

let obj;
if (kind == "num") {
	len = 1;
	obj = 23333;
} else if (kind == "arr") {
	obj = new Uint32Array(len)
} else if (kind == "str") {
	obj = new Uint8Array(len)
}

var workers = new Array()
for (let i = 0; i < thread_num; ++ i) {
	let worker = new Worker(`${root}/test_file/benches/jstest/qjs_worker.js`)
	resolveArr.push(new Array())
	workerNow[i] = 0
	worker.onmessage = (e) => {
		resolveArr[i][workerNow[i]](e.data)
		workerNow[i] += 1
	}
	workers.push(worker)
}
const TOTAL_COUNT = 20000

async function test() {
	t1 = new Date()
	for (let i = 0; i < thread_num; ++ i) {
		let worker = workers[i]
		for (let j = 0; j < TOTAL_COUNT; ++ j) {
			new Promise(function(resolve, reject) {
				worker.postMessage(obj)
				resolveArr[i].push(resolve)
			}).then(res => {})
		}
	}
	t2 = new Date()
	console.log(`Elapsed time: ${(t2 - t1) / 1000}`)
}

async function test2() {
	let worker = workers[0]
	t1 = new Date()
	for (let i = 0; i < thread_num * TOTAL_COUNT; ++ i) {
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
// test2()
