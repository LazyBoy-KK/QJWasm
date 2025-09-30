Duktape.modSearch = function (id) {
    var res = readFile(id)
	var decoder = new TextDecoder('utf-8')
	const str = decoder.decode(res)
	return str
};

var esprimaModule = require('./lib/esprima.js')
var dataModule = require('./data/jquery-1.9.1-string-umd.js')
var start = Date.now()
esprimaModule.parseScript(dataModule.fileContent)
var end = Date.now()
console.log('Time elapsed: ' + (end - start) / 1000)
