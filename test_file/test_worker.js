import { loadScript, evalScript, strerror, loadFile } from "std";
import { setTimeout, clearTimeout, Worker, realpath } from "os";

function getRoot(root) {
    const [path, err] = realpath(root);
    if (err) throw new Error(strerror(err))
    return path
}

const root = getRoot("./test_file/jsapi");

globalThis.self = globalThis;
globalThis.setTimeout = setTimeout;
globalThis.clearTimeout = clearTimeout;
globalThis.WebAssembly = WebAssembly;
globalThis.postMessage = (msg) => Worker.parent.postMessage(msg);

const parent = Worker.parent;

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
    // evalScript(file, { backtrace_barrier: true })
    try {
        loadScript(test)
    } catch (e) {
        console.log(`now load test:${test}`)
        parent.postMessage({type: "result", test: {
            status: 1,
            name: `Exception on ${test}:\n${e.name}`,
            message: e.message,
            stack: e.stack
        }});
    }
}

function handle(e) {
    const ev = e.data;
    loadTest(ev);
    promise_setup(() => {
        return Promise.resolve().then(() => {
            parent.postMessage({type: "exit"});
            parent.onmessage = null;
        })
    })
}

parent.onmessage = handle;