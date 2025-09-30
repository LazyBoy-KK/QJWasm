import { strerror } from "std";
import { readdir, realpath, stat, S_IFDIR, Worker } from "os";

function getRoot(root) {
    const [path, err] = realpath(root);
    if (err) throw new Error(strerror(err))
    return path
}

const root = getRoot("./test_file/jsapi");

function isDir(file) {
    const [fileStat, statErr] = stat(file);
    if (statErr) throw new Error(strerror(statErr))
    return (fileStat.mode & S_IFDIR) == S_IFDIR
}

let unsupported = [
    "idlharness.any.js", // quickjs is not web browser and don't have IDL
    "exception/", // Phase 3 proposals Exception handling
    "tag/", // Phase 3 proposals Exception handling
    // "constructor/multi-value.any.js", // TODO: multi-value
];

// Find the result of web browsers in https://wpt.fyi/results/wasm/jsapi?label=experimental&label=master&aligned&view=subtest
let totals = {
    "constructor/compile.any.js": 9,
    "constructor/instantiate-bad-imports.any.js": 212,
    "constructor/instantiate.any.js": 57,
    "constructor/multi-value.any.js": 3,
    "constructor/toStringTag.any.js": 4,
    "constructor/validate.any.js": 62,
    "error-interfaces-no-symbol-tostringtag.any.js": 3,
    "function/call.tentative.any.js": 2,
    "function/constructor.tentative.any.js": 11,
    "function/table.tentative.any.js": 1,
    "function/type.tentative.any.js": 2,
    "global/constructor.any.js": 60,
    "global/toString.any.js": 2,
    "global/type.tentative.any.js": 13,
    "global/value-get-set.any.js": 68,
    "global/valueOf.any.js": 2,
    "instance/constructor-bad-imports.any.js": 106,
    "instance/constructor-caching.any.js": 1,
    "instance/constructor.any.js": 29,
    "instance/exports.any.js": 4,
    "instance/toString.any.js": 2,
    "interface.any.js": 72,
    "memory/buffer.any.js": 4,
    "memory/constructor-shared.tentative.any.js": 3,
    "memory/constructor-types.tentative.any.js": 3,
    "memory/constructor.any.js": 24,
    "memory/grow.any.js": 19,
    "memory/toString.any.js": 2,
    "memory/type.tentative.any.js": 6,
    "module/constructor.any.js": 10,
    "module/customSections.any.js": 9,
    "module/exports.any.js": 11,
    "module/imports.any.js": 11,
    "module/toString.any.js": 2,
    "prototypes.any.js": 5,
    "table/constructor-types.tentative.any.js": 3,
    "table/constructor.any.js": 31,
    "table/get-set.any.js": 32,
    "table/grow.any.js": 18,
    "table/length.any.js": 4,
    "table/toString.any.js": 2,
    "table/type.tentative.any.js": 4
}

function listTest(tests, root) {
    const [files, readErr] = readdir(root);
    if (readErr) throw new Error(strerror(readErr));
    files.forEach(f => {
        if (f == "." || f == "..") return;
        let file = `${root}/${f}`;
        if (isDir(file)) {
            listTest(tests, file)
        } else {
            if (file.endsWith(".any.js") && !unsupported.some(val => file.search(val) != -1)) {
                tests.push(file)
            }
        }
    });
}

let tests = [];
listTest(tests, root);

let testFileCount = tests.length;
let passCount = 0;
let errorCount = 0;
let allErrors = {};

function loadTest(file) {
    const worker = new Worker("./test_file/test_worker.js");
    let subPassCount = 0;
    let subErrorCount = 0;
    let errors = [];
    worker.onmessage = function (e) {
        const ev = e.data;
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
            case "exit":
                worker.onmessage = null;
                testFileCount--;
                const subTotal = subPassCount + subErrorCount;
                let subpath = file.substring(root.length + 1);
                if (totals[subpath] != subTotal) {
                    console.log(`!!! test ${subpath} have ${totals[subpath]} tests, but only test ${subTotal} !!!`)
                }
                allErrors[subpath] = {
                    errors: errors,
                    total: subTotal,
                    pass: subPassCount,
                    error: subErrorCount,
                };
                passCount += subPassCount;
                errorCount += subErrorCount;
                if (testFileCount == 0) {
                    console.log("# WPT wasm/jsapi test result")
                    console.log("")
                    const total = passCount + errorCount;
                    console.log("**Test result**:");
                    console.log("")
                    console.log(`* Total: ${total}`);
                    console.log(`* Pass: ${passCount}`);
                    console.log(`* Error: ${errorCount}`);
                    for (const [key, value] of Object.entries(allErrors).sort()) {
                        console.log("")
                        console.log(`## \`${key}\``)
                        console.log("")
                        console.log(`* Total: ${value.total}`);
                        console.log(`* Pass: ${value.pass}`);
                        console.log(`* Error: ${value.error}`);
                        if (value.error > 0) {
                            console.log("<details>");
                            console.log("<summary>backtrace of errors</summary>");
                            console.log("");
                            console.log("```");
                            value.errors.forEach(e => console.log(e))
                            console.log("```");
                            console.log("</details>");
                        }
                    }
                }
                return;
        }
    }
    worker.postMessage(file)
}

tests.forEach(f => loadTest(f))
