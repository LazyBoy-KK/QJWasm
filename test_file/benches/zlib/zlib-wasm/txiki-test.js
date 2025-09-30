const wasmBuffer = await tjs.readFile(`./zlib-sample.wasm`)
const module = new WebAssembly.Module(wasmBuffer);
const instance = new WebAssembly.Instance(module);
const memory = instance.exports.memory
const fileBuffer = tjs.readFile(`./data/10mb-sample.json`)
console.log(instance.exports._malloc)
const srcPtr = instance.exports._malloc(fileBuffer.length)
let srcBuffer = new Uint8Array(memory.buffer, srcPtr, fileBuffer.length)
srcBuffer.set(fileBuffer)

function test() {
	let dstLenPtr = instance.exports._malloc(4) // size of int
	let dstPtr = instance.exports._malloc(fileBuffer.length)
	let dstSize = new Uint32Array(memory.buffer, dstLenPtr, 1)
	dstSize[0] = fileBuffer.length
	let comp_res = instance.exports._compress(dstPtr, dstLenPtr, srcPtr, fileBuffer.length)
	let sizeAfterComp = dstSize[0]
	dstSize[0] = fileBuffer.length
	let uncomp_res = instance.exports._uncompress(srcPtr, dstLenPtr, dstPtr, sizeAfterComp)
	// console.log(`comp res:${comp_res} uncomp res:${uncomp_res}`)
	instance.exports._free(dstLenPtr)
	instance.exports._free(dstPtr)
}

let start = Date.now()
test()
let end = Date.now()

console.log(`Time elapsed:${(end - start) / 1000}`)
