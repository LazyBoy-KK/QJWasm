import { getcwd, Worker } from "os"
import * as os from "os"

const [root, err] = getcwd()
if (err) {
    throw Error(`can't get current working directory`)
}

function read_file(file, exports) {
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
	let buffer, ptr;
	if (!exports) {
		buffer = new ArrayBuffer(fileSize)
		ptr = 0
	} else {
		ptr = exports._malloc(fileSize)
		buffer = memory.buffer
	}
    if (os.read(fd, buffer, ptr, fileSize) < 0) {
        throw Error("read file error.\n")
    }
    os.close(fd)
    return { buffer, ptr, fileSize }
}

const module = WebAssembly.load(`./zlib-sample.so`);
const instance = new WebAssembly.Instance(module);
const memory = instance.exports.memory
const readObj = read_file(`./data/mesh.pretty.json`, instance.exports)
// const json = new Uint8Array(readObj.buffer, readObj.ptr, readObj.fileSize)

function test() {
	let dstLenPtr = instance.exports._malloc(4) // size of int
	let dstPtr = instance.exports._malloc(readObj.fileSize)
	let dstSize = new Uint32Array(readObj.buffer, dstLenPtr, 1)
	dstSize[0] = readObj.fileSize
	let comp_res = instance.exports._compress(dstPtr, dstLenPtr, readObj.ptr, readObj.fileSize)
	let sizeAfterComp = dstSize[0]
	dstSize[0] = readObj.fileSize
	let uncomp_res = instance.exports._uncompress(readObj.ptr, dstLenPtr, dstPtr, sizeAfterComp)
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
