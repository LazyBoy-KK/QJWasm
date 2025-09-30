import { deflate } from './deflate.js'
import { inflate } from './inflate.js'

function test(json) {
	const res = deflate(json)
	const res2 = inflate(res)
}

const json = new Uint8Array(read(`../zlib/data/10mb-sample.json`, `binary`))
let start = Date.now()
for (let i = 0; i < 5; ++ i) {
	test(json)
}
let end = Date.now()

console.log(`Time elapsed:${(end - start) / 1000}`)
