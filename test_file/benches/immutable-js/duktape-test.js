Duktape.modSearch = function (id) {
    var res = readFile(id)
	var decoder = new TextDecoder('utf-8');
	const str = decoder.decode(res);
	// console.log(typeof str === 'string')
	return str;
};

var iModule = require('./immutable.js');
var List = iModule.List;
var Map = iModule.Map;

const TOTAL_COUNT = 100000;

function map_benchmark() {
    var map = new Map();
    for (var i = 0; i < TOTAL_COUNT; ++ i) {
        map.set(i, i);
    }
}

function list_benchmark() {
    var list = new List();
    for (var i = 0; i < TOTAL_COUNT; ++ i) {
        list.push(i);
    }
}

var start = Date.now();
map_benchmark();
list_benchmark();
var end = Date.now();
console.log('Time elapsed: ' + (end - start) / 1000);