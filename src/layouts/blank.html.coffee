doctype 5
html lang: 'en', ->
  head ->
    meta charset: 'utf-8'
    title @site.title + ' &middot; ' + @document.title
    style '''
      body{
        margin: 0;
        border-top: 5px solid #bf0000;
        font-family: 'Trebuchet MS';
      }
      
      .slide{
        font-size: 50px;
        width: 600px;
        height: 400px;
        background-color: #cccccc;
      }
    '''
    
  body ->

    text @content
    
    script src: 'http://bartaz.github.io/impress.js/js/impress.js'
    coffeescript ->
      impress().init();