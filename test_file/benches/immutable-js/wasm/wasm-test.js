var instance, malloc, free

const TOTAL_COUNT = 100000

function map_benchmark() {
    let mapSet = instance.exports.mapSet
    let map = instance.exports.mapCreate()
    for (let i = 0; i < TOTAL_COUNT; ++ i) {
        mapSet(map, i, i)
    }
    instance.exports.mapFree(map)
}

function list_benchmark() {
    let listPush = instance.exports.listPush
    let list = instance.exports.listCreate()
    for (let i = 0; i < TOTAL_COUNT; ++ i) {
        listPush(list, i)
    }
    instance.exports.listFree(list)
}

const module = WebAssembly.load("./immutable.so")
instance = new WebAssembly.Instance(module)
malloc = instance.exports.malloc
free = instance.exports.free
let start = Date.now()
map_benchmark()
list_benchmark()
let end = Date.now()
console.log(`Time elapsed: ${(end - start) / 1000}`)