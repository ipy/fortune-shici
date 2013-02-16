fs = require 'fs'

fs.readFile 'quantangshi.json', (err, data) ->
  poems = JSON.parse data
  for poem in poems
    console.log '[32m《' + (poem.title) + '》[m'
    if poem.author
      console.log '[33m作者:' + (poem.author) + '[m'
    console.log poem.content.trim()
    console.log '%'


