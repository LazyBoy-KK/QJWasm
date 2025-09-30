/*
markdown2html.js
Copyright 2023 by Chitpong Kittinadorn under MIT License
*/

export function markdown2html(input) {
    // Split input by empty line
    // SHOULD CUSTOMIZE PER DATA RECORDING SYSTEM, e.g. /\r\n\r\n/g
    let inputArray = input.split(/\n\n/g)

    // console.log(inputArray)  // Should 1st check for proper line break

    // Prep array of paragraphed text (<p>text</p>)
    let paragraphedArray = []

    inputArray.forEach(i => {
        let paragraphedLine = '<p>' + i + '</p>'

        paragraphedArray.push(paragraphedLine)
    })

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

    let processedArray = []

    paragraphedArray.forEach(line => {  // For each line...
        // Replace HR: Must come before other modules
        const foundHrArray = line.match(regexHr)

        if (foundHrArray !== null) {
            foundHrArray.forEach(found => {
                line = line.replace(found, '<hr>')
            })
        }

        // Replace H1
        const foundH1Array = line.match(regexH1)

        if (foundH1Array !== null) {
            foundH1Array.forEach(found => {
                let h1Content = found.replace('<p># ', '<h1>')
                h1Content = h1Content.replace('</p>', '</h1>')

                line = line.replace(found, h1Content)
            })
        }

        // Replace H2
        const foundH2Array = line.match(regexH2)

        if (foundH2Array !== null) {
            foundH2Array.forEach(found => {
                let h2Content = found.replace('<p>## ', '<h2>')
                h2Content = h2Content.replace('</p>', '</h2>')

                line = line.replace(found, h2Content)
            })
        }

        // Replace H3
        const foundH3Array = line.match(regexH3)

        if (foundH3Array !== null) {
            foundH3Array.forEach(found => {
                let h3Content = found.replace('<p>### ', '<h3>')
                h3Content = h3Content.replace('</p>', '</h3>')

                line = line.replace(found, h3Content)
            })
        }

        // Replace H4
        const foundH4Array = line.match(regexH4)

        if (foundH4Array !== null) {
            foundH4Array.forEach(found => {
                let h4Content = found.replace('<p>#### ', '<h4>')
                h4Content = h4Content.replace('</p>', '</h4>')

                line = line.replace(found, h4Content)
            })
        }

        // Replace BOLD
        const foundBoldArray = line.match(regexBold)

        if (foundBoldArray !== null) {
            foundBoldArray.forEach(found => {
                const boldContent = found.replaceAll('**', '')

                line = line.replace(found, '<strong>'+boldContent+'</strong>')
            })
        }

        // Replace EM
        const foundEmArray = line.match(regexEm)

        if (foundEmArray !== null) {
            foundEmArray.forEach(found => {
                const emContent = found.replaceAll('*', '')

                line = line.replace(found, '<em>'+emContent+'</em>')
            })
        }

        // Replace UL
        const foundUlArray = line.match(regexUl)

        if (foundUlArray !== null) {
            foundUlArray.forEach(found => {
                let ulContent = found.replaceAll('<p>', '<ul>')
                ulContent = ulContent.replaceAll('</p>', '</li></ul>')
                ulContent = ulContent.replaceAll('- ', '<li>')
                ulContent = ulContent.replaceAll('\n', '</li>')

                line = line.replace(found, ulContent)
            })
        }

        // Replace OL
        const foundOlArray = line.match(regexOl)

        if (foundOlArray !== null) {
            foundOlArray.forEach(found => {
                let olContent = found.replaceAll('<p>', '<ol>')
                olContent = olContent.replaceAll('</p>', '</li></ol>')
                olContent = olContent.replaceAll(/\d\.\s/g, '<li>')
                olContent = olContent.replaceAll('\n', '</li>')

                line = line.replace(found, olContent)
            })
        }

        // Replace IMG: MUST DO BEFORE REPLACING LINK
        const foundImgArray = line.match(regexImg)

        if (foundImgArray !== null) {
            foundImgArray.forEach(found => {
                const imgAlt = found.split('](')[0].replace('![', '')
                const imgUrl = found.split('](')[1].replace(')', '')

                line = line.replace(found, '<img src="'+imgUrl+'" alt="'+imgAlt+'">')
            })
        }

        // Replace LINK
        const foundLinkArray = line.match(regexLink)

        if (foundLinkArray !== null) {
            foundLinkArray.forEach(found => {
                const linkTitle = found.split('](')[0].replace('[', '')
                const linkUrl = found.split('](')[1].replace(')', '')

                line = line.replace(found, '<a href="'+linkUrl+'">'+linkTitle+'</a>')
            })
        }

        // Log each line, including converted if found in previous if statements
        // console.log(line)

        // Re-create an array of processed lines
        processedArray.push(line)
    })

    // console.log(processedArray)

    const output = processedArray.join('')

    return output
}