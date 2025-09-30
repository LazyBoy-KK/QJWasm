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
    
        await instance.exportsAsync["_initialize"]();
    
        const add = instance.exportsAsync["add"];
        console.log("1+2=", await add(1, 2))
        console.log("3+6=", await add.apply(null, [3, 6]))
    
        const memory = instance.exportsAsync["memory"]
        const addAll = instance.exportsAsync["add-all"];
        const malloc = instance.exportsAsync["malloc"];
        const free = instance.exportsAsync["free"];
        const mallocLen = 10;
        const mallocPtr = await malloc(mallocLen * 4);
        const mallocArr = new Uint32Array(memory.buffer, mallocPtr, mallocLen);
        mallocArr.set([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        console.log(await addAll(mallocPtr, mallocLen));
        await free(mallocPtr);
    } catch(e) {
        console.log(e);
        console.log(e.stack);
    }
}

init()