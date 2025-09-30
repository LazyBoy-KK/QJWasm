// See module search function details below.
Duktape.modSearch = function (id) {
    var res = readFile(id)
	var decoder = new TextDecoder('utf-8')
	const str = decoder.decode(res)
	// console.log(typeof str === 'string')
	return str
};

var Long = require('./long/long_common.js')
var start = Date.now()
for (var i = 0; i < 200000; ++ i) {
	const left = new Long(0x00000001, 0x00001234);
	const right = new Long(0x00000001, 0x00004321);
	const add_res = left.add(right)
	const sub_res = right.sub(left)
	const mul_res = left.multiply(right)
}
var end = Date.now()

console.log('Time elapsed: ' + (end - start) / 1000)
