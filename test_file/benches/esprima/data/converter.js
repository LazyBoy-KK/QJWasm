const fs = require('fs');
const path = require('path');

function convertToJSString(inputFilePath, outputFilePath) {
    try {
        // 读取原始文件内容
        const content = fs.readFileSync(inputFilePath, 'utf8');
        
        // 将内容转换为JS字符串格式
        const jsString = `"${content.replace(/\\/g, '\\\\').replace(/"/g, '\\"').replace(/\n/g, '\\n').replace(/\r/g, '\\r')}"`;
        
        // 写入到输出文件
        fs.writeFileSync(outputFilePath, jsString, 'utf8');
        
        console.log(`转换完成！输出文件：${outputFilePath}`);
    } catch (error) {
        console.error('转换失败：', error.message);
    }
}

// 使用示例
const inputFile = './jquery-1.9.1.js';
const outputFile = './jquery-1.9.1-string.js';
convertToJSString(inputFile, outputFile);