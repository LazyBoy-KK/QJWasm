/*
markdown2html.js
Copyright 2023 by Chitpong Kittinadorn under MIT License
*/

function markdown2html(input) {
    // Split input by empty line
    // SHOULD CUSTOMIZE PER DATA RECORDING SYSTEM, e.g. /\r\n\r\n/g
    var inputArray = input.split(/\n\n/g)

    // console.log(inputArray)  // Should 1st check for proper line break

    // Prep array of paragraphed text (<p>text</p>)
    var paragraphedArray = []

    for (var i = 0; i < inputArray.length; i ++) {
        var paragraphedLine = '<p>' + inputArray[i] + '</p>'
        paragraphedArray.push(paragraphedLine)
    }

    // console.log(paragraphedArray)

    // Process paragraphed array
    // Define regex
    const regexHr = /(<p>\-{4,}<\/p>)/g
    const regexH1 = /(<p>#{1}\s)(.*)/g
    const regexH2 = /(<p>#{2}\s)(.*)/g
    const regexH3 = /(<p>#{3}\s)(.*)/g
    const regexH4 = /(<p>#{4}\s)(.*)/g
    const regexBold = /(\*\*)(.*?)\1/g
    const regexEm = /(\*)(.*?)\1/g
    const regexUl = /(<p>\-)([\S\s]*)(<\/p>)/g
    const regexOl = /(<p>\d\.\s)([\S\s]*)(<\/p>)/g
    const regexLink = /(\[.*\]\(.*\))/g
    const regexImg = /(!\[.*\]\(.*\))/g

    var processedArray = []

    for (var i = 0; i < paragraphedArray.length; i ++) {
        var line = paragraphedArray[i]
        // Replace HR: Must come before other modules
        const foundHrArray = line.match(regexHr)

        if (foundHrArray !== null) {
            for (var j = 0; j < foundHrArray.length; j ++) {
                var found = foundHrArray[j]
                line = line.replace(found, '<hr>')
            }
        }

        // Replace H1
        const foundH1Array = line.match(regexH1)

        if (foundH1Array !== null) {
            for (var j = 0; j < foundH1Array.length; ++ j) {
                var found = foundH1Array[j]
                var h1Content = found.replace('<p># ', '<h1>')
                h1Content = h1Content.replace('</p>', '</h1>')
                line = line.replace(found, h1Content)
            }
        }

        // Replace H2
        const foundH2Array = line.match(regexH2)

        if (foundH2Array !== null) {
            for (var j = 0; j < foundH2Array.length; ++ j) {
                var found = foundH2Array[j]
                var h2Content = found.replace('<p>## ', '<h2>')
                h2Content = h2Content.replace('</p>', '</h2>')
                line = line.replace(found, h2Content)
            }
        }

        // Replace H3
        const foundH3Array = line.match(regexH3)

        if (foundH3Array !== null) {
            for (var j = 0; j < foundH3Array.length; ++ j) {
                var found = foundH3Array[j]
                var h3Content = found.replace('<p>### ', '<h3>')
                h3Content = h3Content.replace('</p>', '</h3>')
                line = line.replace(found, h3Content)
            }
        }

        // Replace H4
        const foundH4Array = line.match(regexH4)

        if (foundH4Array !== null) {
            for (var j = 0; j < foundH4Array.length; ++ j) {
                var found = foundH4Array[j]
                var h4Content = found.replace('<p>#### ', '<h4>')
                h4Content = h4Content.replace('</p>', '</h4>')
                line = line.replace(found, h4Content)
            }
        }

        // Replace BOLD
        const foundBoldArray = line.match(regexBold)

        if (foundBoldArray !== null) {
            for (var j = 0; j < foundBoldArray.length; ++ j) {
                var found = foundBoldArray[j]
                const boldContent = found.replace(/\*\*/g, '')
                line = line.replace(found, '<strong>'+boldContent+'</strong>')
            }
        }

        // Replace EM
        const foundEmArray = line.match(regexEm)

        if (foundEmArray !== null) {
            for (var j = 0; j < foundEmArray.length; ++ j) {
                var found = foundEmArray[j]
                const emContent = found.replace(/\*/g, '')
                line = line.replace(found, '<em>'+emContent+'</em>')
            }
        }

        // Replace UL
        const foundUlArray = line.match(regexUl)

        if (foundUlArray !== null) {
            for (var j = 0; j < foundUlArray.length; ++ j) {
                var found = foundUlArray[j]
                var ulContent = found.replace(/<p>/g, '<ul>')
                ulContent = ulContent.replace(/<\/p>/g, '</li></ul>')
                ulContent = ulContent.replace(/- /g, '<li>')
                ulContent = ulContent.replace(/\n/g, '</li>')
                line = line.replace(found, ulContent)
            }
        }

        // Replace OL
        const foundOlArray = line.match(regexOl)

        if (foundOlArray !== null) {
            for (var j = 0; j < foundOlArray.length; ++ j) {
                var found = foundOlArray[j]
                var olContent = found.replace(/<p>/g, '<ol>')
                olContent = olContent.replace(/<\/p>/g, '</li></ol>')
                olContent = olContent.replace(/\d\.\s/g, '<li>')
                olContent = olContent.replace(/\n/g, '</li>')
                line = line.replace(found, olContent)
            }
        }

        // Replace IMG: MUST DO BEFORE REPLACING LINK
        const foundImgArray = line.match(regexImg)

        if (foundImgArray !== null) {
            for (var j = 0; j < foundImgArray.length; ++ j) {
                var found = foundImgArray[j]
                const imgAlt = found.split('](')[0].replace('![', '')
                const imgUrl = found.split('](')[1].replace(')', '')
                line = line.replace(found, '<img src="'+imgUrl+'" alt="'+imgAlt+'">')
            }
        }

        // Replace LINK
        const foundLinkArray = line.match(regexLink)

        if (foundLinkArray !== null) {
            for (var j = 0; j < foundLinkArray.length; ++ j) {
                var found = foundLinkArray[j]
                const linkTitle = found.split('](')[0].replace('[', '')
                const linkUrl = found.split('](')[1].replace(')', '')
                line = line.replace(found, '<a href="'+linkUrl+'">'+linkTitle+'</a>')
            }
        }

        // Log each line, including converted if found in previous if statements
        // console.log(line)

        // Re-create an array of processed lines
        processedArray.push(line)
    }

    // console.log(processedArray)

    const output = processedArray.join('')

    return output
}

module.exports = {
    markdown2html
}