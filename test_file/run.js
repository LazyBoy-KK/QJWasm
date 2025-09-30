import { loadScript, evalScript, strerror, exit, loadFile } from "std";
import { setTimeout, clearTimeout, realpath } from "os";
import * as os from "os";

function getRoot(root) {
    const [path, err] = realpath(root);
    if (err) throw new Error(strerror(err))
    return path
}

let subPassCount = 0;
let subErrorCount = 0;
let errors = [];

function handleMsg(ev) {
    const test = ev.test;
    switch (ev.type) {
        case "start":
            break
        case "test_state":
            break;
        case "result":
            switch (test.status) {
                case 0:
                    subPassCount++;
                    break;
                case 1:
                    subErrorCount++;
                    errors.push(`${test.name}: ${test.message}\n${test.stack}`);
                    break;
                default:
                    throw new Error("Unknown Result Status")
            }
            break;
        case "completion":
            break;
    }
}

const root = getRoot("./test_file/jsapi");

globalThis.self = globalThis;
globalThis.setTimeout = setTimeout;
globalThis.clearTimeout = clearTimeout;
globalThis.WebAssembly = WebAssembly;
globalThis.postMessage = (msg) => handleMsg(msg);

loadScript(`${root}/testharness.js`)

const IMPORT = "META: script=";

function loadTest(test) {
    const file = loadFile(test);
    const split = file.split('\n', 5);
    for (var i = 0; i < split.length; i++) {
        const idx = split[i].search(IMPORT);
        if (idx >= 0) {
            let script = split[i].substring(idx + IMPORT.length);
            script = script.replace("/wasm/jsapi/", `${root}/`);
            loadScript(script)
        }
    }
    try {
        evalScript(file, { backtrace_barrier: true })
    } catch (e) {
        console.log(`Exception on ${test}:\n${e.name}: ${e.message}\n${e.stack}`);
    }
    promise_setup(() => {
        return Promise.resolve().then(() => {
            const subTotal = subPassCount + subErrorCount;
            errors.sort()
            errors.forEach(e => console.log(e))
            console.log(`Test result for ${test}`);
            console.log(`Total: ${subTotal}`);
            console.log(`Pass: ${subPassCount}`);
            console.log(`Error: ${subErrorCount}`);
        })
    })
}

let file = scriptArgs[1];

if (!file) {
    console.log(`usage: ${scriptArgs[0]} <path to test.any.js>`);
    exit(1);
}

if (file.charAt(0) == ".") {
    const [pwd, pwdErr] = os.getcwd();
    if (pwdErr) {
        throw new Error(`can't get cwd, ${strerror(pwdErr)}`)
    }
    file = `${pwd}/${file}`;
}

loadTest(file)