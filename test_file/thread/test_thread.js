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
    console.log(Object.keys(instance.exportsAsync));

    console.log(instance.exportsAsync["_initialize"] instanceof Function)
    await instance.exportsAsync["_initialize"]();

    const add = instance.exportsAsync["add"];
    console.log(typeof add)
    add(1, 2).then(res => {
        console.log("1+2=", res);
    })
    add.apply(null, [3, 6]).then(res => {
        console.log("3+6=", res);
    })

    const helloPtr = instance.exportsAsync["hello-ptr"];
    const helloLen = instance.exportsAsync["hello-len"];
    const ptr = await helloPtr();
    const len = await helloLen();
    const memory = instance.exportsAsync["memory"]
    const hello = new Uint8Array(memory.buffer, ptr, len);
    const UTF8 = new TextDecoder("utf-8");
    const helloString = UTF8.decode(hello);
    console.log(helloString);

    const doCalc = instance.exportsAsync["calc"];
    console.log(await doCalc(3, 6))
    console.log(await doCalc(2, 6))

    const addAll = instance.exportsAsync["add-all"];
    const malloc = instance.exportsAsync["malloc"];
    const free = instance.exportsAsync["free"];
    const mallocLen = 10;
    const mallocPtr = await malloc(mallocLen * 4);
    const mallocArr = new Uint32Array(memory.buffer, mallocPtr, mallocLen);
    mallocArr.set([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
    console.log(await addAll(mallocPtr, mallocLen));
    await free(mallocPtr);

    const testLog = instance.exportsAsync["test-log"];
    try {
        await testLog();
    } catch (e) {
        console.log("test Error in wasm import:")
        console.log(typeof e)
        console.log(e instanceof Error)
        console.log(e)
        console.log(e.stack)
    }
}

init()