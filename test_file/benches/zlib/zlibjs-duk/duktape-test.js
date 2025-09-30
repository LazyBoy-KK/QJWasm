Duktape.modSearch = function (id) {
    var res = readFile(id + '.js')
	var decoder = new TextDecoder('utf-8')
	const str = decoder.decode(res)
	// console.log(typeof str === 'string')
	return str
};

var dModule = require('./deflate')
var iModule = require('./inflate')
var deflate = dModule.deflate
var inflate = iModule.inflate

function test(json) {
	const res = deflate(json)
	const res2 = inflate(res)
}

const json = new Uint8Array(readFile('../zlib/data/mesh.pretty.json'));
var start = Date.now();
for (var i = 0; i < 5; ++ i) {
	test(json)
}
var end = Date.now()

console.log('Time elapsed: ' + (end - start) / 1000)
