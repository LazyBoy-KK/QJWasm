'use strict';


const _has = function(obj, key) {
  return Object.prototype.hasOwnProperty.call(obj, key);
};

module.exports.assign = function (obj /*from1, from2, from3, ...*/) {
  const sources = Array.prototype.slice.call(arguments, 1);
  while (sources.length) {
    const source = sources.shift();
    if (!source) { continue; }

    if (typeof source !== 'object') {
      throw new TypeError(source + 'must be non-object');
    }

    for (var i = 0; i < sources.length; i += 1) {
	  var p = sources[i]
      if (_has(source, p)) {
        obj[p] = source[p];
      }
    }
  }

  return obj;
};


// Join array of chunks to single array.
module.exports.flattenChunks = function(chunks) {
  // calculate data length
  var len = 0;

  for (var i = 0, l = chunks.length; i < l; i++) {
    len += chunks[i].length;
  }

  // join chunks
  const result = new Uint8Array(len);

  for (var i = 0, pos = 0, l = chunks.length; i < l; i++) {
    var chunk = chunks[i];
    result.set(chunk, pos);
    pos += chunk.length;
  }

  return result;
};
