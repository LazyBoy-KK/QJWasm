Duktape.modSearch = function (id) {
    var res = readFile(id)
	var decoder = new TextDecoder('utf-8')
	const str = decoder.decode(res)
	return str
};

var mModule = require('./lib/mark2html.umd.js')
var markdown2html = mModule.markdown2html
var src = "# Heading Example\n\nThis is a sample paragraph with some **bold text**, *italic text*, and `inline code`.\n\n"
const TARGET_SIZE = 512 * 1024

while (src.length < TARGET_SIZE) {
    src += src
}

var start = Date.now()
const html = markdown2html(src)
var end = Date.now()
console.log('Time elapsed: ' + (end - start) / 1000)