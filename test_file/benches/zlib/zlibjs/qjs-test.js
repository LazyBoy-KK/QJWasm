import { getcwd } from "os"
import * as os from "os"
import { deflate } from './deflate.js'
import { inflate } from './inflate.js'

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
	let buffer = new ArrayBuffer(fileSize)
    if (os.read(fd, buffer, 0, fileSize) < 0) {
        throw Error("read file error.\n")
    }
    os.close(fd)
    return buffer
}

function test(json) {
	const res = deflate(json)
	const res2 = inflate(res)
}

const json = new Uint8Array(read_file(`../zlib/data/mesh.pretty.json`))
let start = Date.now()
for (let i = 0; i < 5; ++ i) {
	test(json)
}
let end = Date.now()

console.log(`Time elapsed:${(end - start) / 1000}`)
