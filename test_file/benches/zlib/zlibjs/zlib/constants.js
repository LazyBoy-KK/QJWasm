'use strict';

// (C) 1995-2013 Jean-loup Gailly and Mark Adler
// (C) 2014-2017 Vitaly Puzrin and Andrey Tupitsin
//
// This software is provided 'as-is', without any express or implied
// warranty. In no event will the authors be held liable for any damages
// arising from the use of this software.
//
// Permission is granted to anyone to use this software for any purpose,
// including commercial applications, and to alter it and redistribute it
// freely, subject to the following restrictions:
//
// 1. The origin of this software must not be misrepresented; you must not
//   claim that you wrote the original software. If you use this software
//   in a product, an acknowledgment in the product documentation would be
//   appreciated but is not required.
// 2. Altered source versions must be plainly marked as such, and must not be
//   misrepresented as being the original software.
// 3. This notice may not be removed or altered from any source distribution.

// module.exports = {

//   /* Allowed flush values; see deflate() and inflate() below for details */
//   Z_NO_FLUSH:         0,
//   Z_PARTIAL_FLUSH:    1,
//   Z_SYNC_FLUSH:       2,
//   Z_FULL_FLUSH:       3,
//   Z_FINISH:           4,
//   Z_BLOCK:            5,
//   Z_TREES:            6,

//   /* Return codes for the compression/decompression functions. Negative values
//   * are errors, positive values are used for special but normal events.
//   */
//   Z_OK:               0,
//   Z_STREAM_END:       1,
//   Z_NEED_DICT:        2,
//   Z_ERRNO:           -1,
//   Z_STREAM_ERROR:    -2,
//   Z_DATA_ERROR:      -3,
//   Z_MEM_ERROR:       -4,
//   Z_BUF_ERROR:       -5,
//   //Z_VERSION_ERROR: -6,

//   /* compression levels */
//   Z_NO_COMPRESSION:         0,
//   Z_BEST_SPEED:             1,
//   Z_BEST_COMPRESSION:       9,
//   Z_DEFAULT_COMPRESSION:   -1,


//   Z_FILTERED:               1,
//   Z_HUFFMAN_ONLY:           2,
//   Z_RLE:                    3,
//   Z_FIXED:                  4,
//   Z_DEFAULT_STRATEGY:       0,

//   /* Possible values of the data_type field (though see inflate()) */
//   Z_BINARY:                 0,
//   Z_TEXT:                   1,
//   //Z_ASCII:                1, // = Z_TEXT (deprecated)
//   Z_UNKNOWN:                2,

//   /* The deflate compression method */
//   Z_DEFLATED:               8
//   //Z_NULL:                 null // Use -1 or null inline, depending on var type
// };

var Z_NO_FLUSH =         0
var Z_PARTIAL_FLUSH =    1
var Z_SYNC_FLUSH =       2
var Z_FULL_FLUSH =       3
var Z_FINISH =           4
var Z_BLOCK =            5
var Z_TREES =            6

/* Return codes for the compression/decompression functions. Negative values
* are errors, positive values are used for special but normal events.
*/
var Z_OK =               0
var Z_STREAM_END =       1
var Z_NEED_DICT =        2
var Z_ERRNO =           -1
var Z_STREAM_ERROR =    -2
var Z_DATA_ERROR =      -3
var Z_MEM_ERROR =       -4
var Z_BUF_ERROR =       -5
//Z_VERSION_ERROR: -6,

/* compression levels */
var Z_NO_COMPRESSION =         0
var Z_BEST_SPEED =             1
var Z_BEST_COMPRESSION =       9
var Z_DEFAULT_COMPRESSION =   -1


var Z_FILTERED =               1
var Z_HUFFMAN_ONLY =           2
var Z_RLE =                    3
var Z_FIXED =                  4
var Z_DEFAULT_STRATEGY =       0

/* Possible values of the data_type field (though see inflate()) */
var Z_BINARY =                 0
var Z_TEXT =                   1
//Z_ASCII:                1, // = Z_TEXT (deprecated)
var Z_UNKNOWN =                2

/* The deflate compression method */
var Z_DEFLATED =               8

export {
  Z_NO_FLUSH,
  Z_PARTIAL_FLUSH,
  Z_SYNC_FLUSH,
  Z_FULL_FLUSH,
  Z_FINISH,
  Z_BLOCK,
  Z_TREES,

  /* Return codes for the compression/decompression functions. Negative values
  * are errors, positive values are used for special but normal events.
  */
  Z_OK,
  Z_STREAM_END,
  Z_NEED_DICT,
  Z_ERRNO,
  Z_STREAM_ERROR,
  Z_DATA_ERROR,
  Z_MEM_ERROR,
  Z_BUF_ERROR,
  //Z_VERSION_ERROR: -6,

  /* compression levels */
  Z_NO_COMPRESSION,
  Z_BEST_SPEED,
  Z_BEST_COMPRESSION,
  Z_DEFAULT_COMPRESSION,


  Z_FILTERED,
  Z_HUFFMAN_ONLY,
  Z_RLE,
  Z_FIXED,
  Z_DEFAULT_STRATEGY,

  /* Possible values of the data_type field (though see inflate()) */
  Z_BINARY,
  Z_TEXT,
  //Z_ASCII:                1, // = Z_TEXT (deprecated)
  Z_UNKNOWN,

  /* The deflate compression method */
  Z_DEFLATED,
}
