doctype 5
html lang: 'en', ->
  head ->
    meta charset: 'utf-8'
    title @document.title
    meta name:"viewport", content:"width=1024"
    link rel: 'stylesheet', href: @document.css
    #link rel: 'stylesheet', href: 'http://bartaz.github.io/impress.js/css/impress-demo.css'
    link href: 'http://fonts.googleapis.com/css?family=Pinyon+Script', rel: 'stylesheet', type:'text/css'
    
  body ->

    text @content
    
    #script src: 'http://bartaz.github.io/impress.js/js/impress.js'
    script src: '../vendor/impress.js'
    coffeescript ->
      impress().init();