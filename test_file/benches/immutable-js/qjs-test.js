import { List, Map } from './immutable.es.js'

const TOTAL_COUNT = 100000

function map_benchmark() {
    let map = new Map()
    for (let i = 0; i < TOTAL_COUNT; ++ i) {
        map.set(i, i)
    }
}

function list_benchmark() {
    let list = new List()
    for (let i = 0; i < TOTAL_COUNT; ++ i) {
        list.push(i)
    }
}

let start = Date.now()
map_benchmark()
list_benchmark()
let end = Date.now()
console.log(`Time elapsed:${(end - start) / 1000}`)