const buffer = read(`./zlib-sample.wasm`, `binary`)
const module = new WebAssembly.Module(buffer);
const instance = new WebAssembly.Instance(module);
const memory = instance.exports.memory
const json = read(`./data/10mb-sample.json`, `binary`)
const srcPtr = instance.exports._malloc(json.byteLength)
let srcArr = new Uint8Array(memory.buffer, srcPtr, json.byteLength)
srcArr.set(json)

function test() {
	let dstLenPtr = instance.exports._malloc(4) // size of int
	let dstPtr = instance.exports._malloc(json.byteLength)
	let dstSize = new Uint32Array(memory.buffer, dstLenPtr, 1)
	dstSize[0] = json.byteLength
	let comp_res = instance.exports._compress(dstPtr, dstLenPtr, srcPtr, json.byteLength)
	let sizeAfterComp = dstSize[0]
	dstSize[0] = json.byteLength
	let uncomp_res = instance.exports._uncompress(srcPtr, dstLenPtr, dstPtr, sizeAfterComp)
	// console.log(`comp res:${comp_res} uncomp res:${uncomp_res}`)
	instance.exports._free(dstLenPtr)
	instance.exports._free(dstPtr)
}

let start = Date.now()
for (let i = 0; i < 5; ++ i) {
	test()
}
let end = Date.now()

console.log(`Time elapsed:${(end - start) / 1000}`)
