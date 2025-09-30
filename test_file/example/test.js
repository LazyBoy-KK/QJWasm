import * as os from "os";
import { exit } from "std";

let file = scriptArgs[1];

if (!file) {
    console.log(`usage: ${scriptArgs[0]} <path to wasm>`);
    exit(1);
}

if (file.charAt(0) == ".") {
    const [pwd, pwdErr] = os.getcwd();
    if (pwdErr) {
        throw new Error(`can't get cwd, ${strerror(pwdErr)}`)
    }
    file = `${pwd}/${file}`;
}

const [fstat, fstatErr] = os.stat(file);
if (fstatErr) {
    console.log("wasm file not found, ", fstatErr);
    throw ""
}
const fileSize = fstat.size;

const fd = os.open(file, os.O_RDONLY);
const wasmBytes = new ArrayBuffer(fileSize);
os.read(fd, wasmBytes, 0, fileSize);

var instance, module;

async function init() {
    try {
        const obj = await WebAssembly.instantiate(wasmBytes);
        instance = obj.instance;
        module = obj.module;
    
        instance.exports["_initialize"]();
    
        const add = instance.exports["add"];
        console.log("1+2=", add(1, 2))
        console.log("3+6=", add.apply(null, [3, 6]))
    
        const memory = instance.exports["memory"]
        const addAll = instance.exports["add-all"];
        const malloc = instance.exports["malloc"];
        const free = instance.exports["free"];
        const mallocLen = 10;
        const mallocPtr = malloc(mallocLen * 4);
        const mallocArr = new Uint32Array(memory.buffer, mallocPtr, mallocLen);
        mallocArr.set([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        console.log(addAll(mallocPtr, mallocLen));
        free(mallocPtr);
    } catch(e) {
        console.log(e);
        console.log(e.stack);
    }
}

init()