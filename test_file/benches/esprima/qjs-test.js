import * as _ from './lib/esprima_qjs.js'
import { fileContent } from './data/jquery-1.9.1-string.js'

let start = Date.now()
esprima.parseScript(fileContent)
let end = Date.now()
console.log(`Time elapsed: ${(end - start) / 1000}`)