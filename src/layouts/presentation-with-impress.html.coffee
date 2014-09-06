doctype 5
html lang: 'jp', ->
  head ->
    meta charset: 'utf-8'
    title @document.title
    meta name:"viewport", content:"width=1024"
    link rel: 'stylesheet', href: @getPath @document.css
    link href: 'http://fonts.googleapis.com/css?family=Pinyon+Script', rel: 'stylesheet', type:'text/css'
    
  body ->

    text @content
    
    script src: @getPath 'vendor/impress.js'
    #script src: '//cdnjs.cloudflare.com/ajax/libs/impress.js/0.5.3/impress.min.js'
    coffeescript ->
      impress().init();
