#!/usr/bin/env coffee

fs = require 'fs'

fs.readFile 'quantangshi', 'utf-8', (err, data) ->
  throw err if err
  lineArray = data.split('\n')
  console.log lineArray[30]
  

  titlep = /卷\d+_\d+\s*【([^x00-xff]+)】/
  poems = []
  poemTemp = {}
  counter = 0

  test = (poems) ->
    authors = []
    for i in poems
      if i in authors
        console.log i
        authors.push i


  lineArray.forEach (line) ->
    counter++
    if counter is lineArray.length-1
      poems.push(poemTemp) if poemTemp
      console.log poems.length
      fs.writeFile 'quantangshi.json', JSON.stringify(poems), (err) ->
      test(poems)
    line = line.trim()
    unless line then return
    match = titlep.exec line
    if match
      poems.push(poemTemp) if poemTemp and poemTemp.title
      poemTemp = {}
      poemTemp.content = ''
      poemTemp.title = match[1]
      return
    if line.match /^卷[^x00-xff]+$/ then return
    if 1 < line.length < 6
      if poemTemp
        unless poemTemp.author or poemTemp.content
          poemTemp.author = line
          return
      return
    poemTemp.content += line
    poemTemp.content += '\n'
    
    
