const module = WebAssembly.load('./src/markdown.so')
const instance = new WebAssembly.Instance(module)
var memory = instance.exports.memory
export var HEAPU8 = new Uint8Array(memory.buffer)
export var HEAP32 = new Int32Array(memory.buffer)
export var _initialize = instance.exports._initialize
export var _parseUTF8 = instance.exports._parseUTF8
var wrealloc = instance.exports._wrealloc
export var _wfree = instance.exports._wfree
export var _WErrGetCode = instance.exports._WErrGetCode
export var _WErrGetMsg = instance.exports._WErrGetMsg
export var _WErrClear = instance.exports._WErrClear

export function _wrealloc(ptr, size) {
    let newPtr = instance.exports._wrealloc(ptr, size)
    if (memory.buffer.byteLength != HEAPU8.byteLength) {
        HEAPU8 = new Uint8Array(memory.buffer)
        HEAP32 = new Int32Array(memory.buffer)
    }
    return newPtr
}

export function updateView() {
    HEAPU8 = new Uint8Array(memory.buffer)
    HEAP32 = new Int32Array(memory.buffer)
}