doctype 5
html lang: (if @document.language then @document.language else 'en'), 'ng-app':'mywebsite', ->
  head ->
    meta charset: 'utf-8'
    title @site.title + ' &middot; ' + @document.title
    meta name: 'description', content: @document.description
    meta name: 'viewport', content: 'width=device-width, initial-scale=1'
    meta 'http-equiv': 'X-UA-Compatible', 'content': 'IE=edge'
    link rel:"author", href:"https://plus.google.com/u/1/115589168984238296965"
    ie 'lt IE 9', ->
       script src: @getPath('vendor/html5shiv.js')
       script src: @getPath('vendor/respond.min.js')

    if @document.bootstrap is true
      link rel: 'stylesheet', href: @getPath 'vendor/bootstrap/bootstrap.min.css'

    link rel: 'stylesheet', href: @getPath 'css/style-concat.min.css?2016-04-02'

    if @document.slimbox is true
      link rel: 'stylesheet', href: @getPath 'vendor/slimbox2/css/slimbox2.css'

    if @document.syntaxHighlighter is true
      link rel: 'stylesheet', href: @getPath('css/highlight.css')

    if @document.angular is true
      script src: @lib.angular

  body (if @document.className then '.' + @document.className else ''), 'ng-controller': (if @document.controller then @document.controller else ''), ->

    text @partial 'header.html'

    text @content

    text @partial 'footer.html'

    if @document.flowtype is true
      script src: @getPath 'vendor/flowtype.js'
      coffeescript ->
        $('h1').flowtype({
          minFont: 20,
          maxFont: 60,
          fontRatio : 22,
          lineRatio : 1
        });

    if @document.slimbox is true
      script src: @getPath 'vendor/jquery.min.js'
      script src: @getPath 'vendor/slimbox2/js/slimbox2.js'
    if @document.bootstrap is true
      script src: @getPath 'vendor/jquery.min.js'
      script src: @getPath 'vendor/bootstrap/bootstrap.min.js'

    if @document.js
      for file in @document.js
        script src: @getPath 'js/'+file

    script ->
      # Load font files async.
      text @partial 'load-css.js'

    text @partial 'googleanalytics.html'
