footer '.hidden-print', ->
  div '.container', ->
   div '.row', ->
    div '.col-sm-6.social-links', ->
      a target: "_blank", href:"http://www.linkedin.com/in/michaelrambeau", title: "View Michael Rambeau profile on Linkedin", ->
        img src: @getPath("img/logos/linkedin.png")
      a target: "_blank", href:"http://www.facebook.com/profile.php?id=525808362", title: "View Michael Rambeau profile on Facebook", ->
        img src: @getPath("img/logos/facebook.png")
      a target: "_blank", href:"http://mixi.jp/show_profile.pl?id=30588844&from=navi", title: "View Michael Rambeau profile on Mixi", ->
        img src: @getPath("img/logos/mixi.png")
    div '.col-sm-6.text-right', ->
      p 'http://michaelrambeau.com'
      p 'Last update: '+(new Date()).toDateString()
      