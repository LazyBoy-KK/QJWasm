import { markdown2html } from "./lib/mark2html.js"

var src = "# Heading Example\n\nThis is a sample paragraph with some **bold text**, *italic text*, and `inline code`.\n\n"
const TARGET_SIZE = 512 * 1024

while (src.length < TARGET_SIZE) {
    src += src
}

let start = Date.now()
const html = markdown2html(src)
let end = Date.now()
console.log(html.length)
console.log(`Time elapsed: ${(end - start) / 1000}`)