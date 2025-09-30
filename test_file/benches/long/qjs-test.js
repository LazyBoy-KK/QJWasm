import { Long } from "./long/long.js"

let start = Date.now()
for (let i = 0; i < 200000; ++ i) {
	const left = new Long(0x00000001, 0x00001234);
	const right = new Long(0x00000001, 0x00004321);
	const add_res = left.add(right)
	const sub_res = right.sub(left)
	const mul_res = left.multiply(right)
}
let end = Date.now()

console.log(`Time elapsed:${(end - start) / 1000}`)
