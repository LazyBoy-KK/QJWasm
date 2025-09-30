import { parse } from "./src/md.js"

var src = "# Heading Example\n\nThis is a sample paragraph with some **bold text**, *italic text*, and `inline code`.\n\n"
const TARGET_SIZE = 512 * 1024

while (src.length < TARGET_SIZE) {
    src += src
}

let start = Date.now()
const html = parse(src)
let end = Date.now()
console.log(`Time elapsed: ${(end - start) / 1000}`)