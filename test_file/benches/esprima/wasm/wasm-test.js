import { getcwd } from "os"
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
        buffer = new ArrayBuffer(fileSize + 1)
        ptr = 0
    } else {
        ptr = exports.malloc(fileSize + 1)
        buffer = exports.memory.buffer
    }
    if (os.read(fd, buffer, ptr, fileSize) < 0) {
        throw Error("read file error.\n")
    }
    let view = new Uint8Array(buffer, ptr + fileSize - 1, 1)
    view[0] = 0
    os.close(fd)
    return { buffer, ptr, fileSize: fileSize - 1 }
}

var memory
const module = WebAssembly.load('./gumnut-core/gumnut.so')
const instance = new WebAssembly.Instance(module, {
    "env": {
        "parserOpen": () => { return 0 },
        "parserCallback": () => {},
        "parserClose": () => {},
    }
})
memory = instance.exports.memory
let fileObj = read_file('../data/jquery-1.9.1.js', instance.exports)
let parserInit = instance.exports.parserInit
let parserRun = instance.exports.parserRun
let start = Date.now()
let init_res = parserInit(fileObj.ptr, fileObj.fileSize)
while (true) {
    let res = parserRun()
    if (res < 0) {
        console.log("error!")
        break
    }
    if (res == 0) {
        break
    }
}
let end = Date.now()
console.log(`Time elapsed:${(end - start) / 1000}`)