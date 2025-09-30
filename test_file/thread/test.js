import * as os from "os";
import { exit } from "std";

console.log("List of properties in WebAssembly:", Object.keys(WebAssembly));

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

console.log("===========")

var instance, module;

const importObject = {
    "test": {
        "calc": function (x, y) {
            return x * (y - x)
        },
        "log": function (ptr, len) {
            const mem = instance.exports["memory"].buffer;
            const logArray = new Uint8Array(mem, ptr, len);
            const UTF8 = new TextDecoder("utf-8");
            const logString = UTF8.decode(logArray);
            // throw new Error("aa");
            console.log(logString);
        }
    }
}

async function init() {
    try {
        const obj = await WebAssembly.instantiate(wasmBytes, importObject);
        instance = obj.instance;
        module = obj.module;
        const exports = WebAssembly.Module.exports(module);
        const imports = WebAssembly.Module.imports(module);
    
        console.log("exports:");
        for (let i = 0; i < exports.length; i++) {
            console.log(`name: ${exports[i].name} kind: ${exports[i]["kind"]}`);
        }
        console.log("imports:");
        for (let i = 0; i < imports.length; i++) {
            console.log(`name: ${imports[i]["module"]}::${imports[i]["name"]} kind: ${imports[i]["kind"]}`);
        }
    
        console.log("===========")
    
        console.log(module instanceof WebAssembly.Module);
        console.log(instance instanceof WebAssembly.Instance);
        console.log(module);
        console.log(instance);
    
        console.log("instance exports:");
        console.log(Object.keys(instance.exports));
    
        console.log(instance.exports["_initialize"] instanceof Function)
        instance.exports["_initialize"]();
    
        const add = instance.exports["add"];
        console.log(typeof add)
        console.log("1+2=", add(1, 2))
        console.log("3+6=", add.apply(null, [3, 6]))
    
        const helloPtr = instance.exports["hello-ptr"];
        const helloLen = instance.exports["hello-len"];
        const ptr = helloPtr();
        const len = helloLen();
        const memory = instance.exports["memory"]
        const hello = new Uint8Array(memory.buffer, ptr, len);
        const UTF8 = new TextDecoder("utf-8");
        const helloString = UTF8.decode(hello);
        console.log(helloString);
    
        const doCalc = instance.exports["calc"];
        console.log(doCalc(3, 6))
        console.log(doCalc(2, 6))
    
        const addAll = instance.exports["add-all"];
        const malloc = instance.exports["malloc"];
        const free = instance.exports["free"];
        const mallocLen = 10;
        const mallocPtr = malloc(mallocLen * 4);
        const mallocArr = new Uint32Array(memory.buffer, mallocPtr, mallocLen);
        mallocArr.set([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        console.log(addAll(mallocPtr, mallocLen));
        free(mallocPtr);
    
        const testLog = instance.exports["test-log"];
        try {
            testLog();
        } catch (e) {
            console.log("test Error in wasm import:")
            console.log(typeof e)
            console.log(e instanceof Error)
            console.log(e)
            console.log(e.stack)
        }
    } catch(e) {
        console.log(e)
        console.log(e.stack)
    }
}

init()