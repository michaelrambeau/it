doctype 5
html lang: 'en','ng-app':'', ->
  head ->
    meta charset: 'utf-8'
    title @site.title + ' &middot; ' + @document.title
    meta name: 'description', content: @document.description
    meta name: 'viewport', content: 'width=device-width, initial-scale=1'
    meta 'http-equiv': 'X-UA-Compatible', 'content': 'IE=edge'
    
    ie 'lt IE 9', ->
       script src: @getPath('vendor/html5shiv.js')
       script src: @getPath('vendor/respond.min.js')
    
    link rel: 'stylesheet', href:  @getPath 'css/main.css?v=2013-12'
    if @document.slimbox is true
      link rel: 'stylesheet', href: @getPath 'vendor/slimbox2/css/slimbox2.css'    
      
    #link rel: 'stylesheet', href:  'http://fonts.googleapis.com/css?family=Ubuntu+Condensed'
    #link rel: 'stylesheet', href:  'http://fonts.googleapis.com/css?family=PT+Serif'
    
    if @document.syntaxHighlighter is true
      link rel: 'stylesheet', href: @getPath('css/highlight.css')
    
    if @document.angular is true
      script src: 'https://ajax.googleapis.com/ajax/libs/angularjs/1.1.5/angular.min.js' 
          
  body (if @document.className then '.' + @document.className else ''), ->
  
    fixed = false
    div '.header.navbar.navbar-inverse.nav-mike.' + (if fixed then 'navbar-fixed-top' else ''), ->
      div '.container', ->
        #span '.mike.hidden-xs', 'Michael Rambeau'
        
        div '.navbar-header', ->
          button '.navbar-toggle', 'data-toggle':'collapse','data-target':'.navbar-collapse', ->
            span '.icon-bar',''
            span '.icon-bar',''
            span '.icon-bar',''
          a '.navbar-brand', href: @getPath(''), 'michaelrambeau.com', ->
            img '.logo-mike', src: @getPath('img/mr.png'), alt: 'Michael Rambeau'        
        
        div '.collapse.navbar-collapse', ->
          ul '.nav.navbar-nav', ->
            li class: (if @document.menuId == 'HOME' then 'active' else ''), ->
              a href: @getPath(''),'home'
            li class: (if @document.menuId == 'APPS' then 'active' else ''),->
              a href: @getPath('projects'), 'projects'
            li class: (if @document.menuId == 'EXPERIENCE' then 'active' else ''),->
              a href: @getPath('resume'), 'resume'
            li class: (if @document.menuId == 'POSTS' then 'active' else ''),->
              a href: @getPath('posts'), 'posts'
    
    #text @partial 'header.html'

    div '.container.main', ->
      div '.page-content', 'contenteditable': 'false', ->
        if @document.isPost
          div '.title', ->
            div '.post-date.hidden-print', ->
              div '.month', @getMonth @document.date
              div '.day', @getDate @document.date
            h1 @document.title
          div '.clearfix', ->
            @content
        else
          h1 @document.title unless @document.noTitle is true
          @content
    
      if @document.comments is true
        div '.hidden-print', ->
          text @partial 'disqus'
    
    #the footer is outside the div.wrap
    text @partial 'footer.html'
        
    script src: '//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'
    #script src: @getPath 'vendor/jquery.min.js'
    script src: @getPath 'vendor/bootstrap.min.js?v3.0.3'
    
    if @document.flowtype is true
      script src: @getPath 'vendor/flowtype.js'
      coffeescript ->
        $('h1').flowtype({
          minFont   : 20,
          maxFont   : 60,
          fontRatio : 22,
          lineRatio : 1
        });
        
    if @document.slimbox is true
      script src: @getPath 'vendor/slimbox2/js/slimbox2.js'
    
    if @document.js
      for file in @document.js
        script src: @getPath 'js/'+file
        
    text @partial 'googleanalytics.html'
    
        
    
        
