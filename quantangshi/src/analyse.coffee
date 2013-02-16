fs = require 'fs'

fs.readFile 'quantangshi.json', (err, data) ->
  poems = JSON.parse data
  authors = {}
  counter = 0
  for poem in poems
    c = poem.content
    if c[c.length-1] isnt '\n' or c[c.length-2] isnt '。'
      console.log c 
    #authors[poem.author] = true
    #if ++counter is poems.length
      #kcount = 0
      #for k,v of authors
        #console.log k
        #kcount++
      #console.log kcount


