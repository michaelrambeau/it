---
layout: 'review'
title: 'The best of 2014'
description: 'A selection of web development tools I found in 2014.'
date: '2015-01-10'
menuId: POSTS
comments: true
active: true
homepage: false
standalone: true
image: '2015-01-bestof.jpg'
---

tools=[
  title: "Brackets"
  url: "http://brackets.io/"
  github: "https://github.com/adobe/brackets"
  stars: 20531
  description: '''
    "A modern open-source code editor for HTML, CSS and JavaScript that's built in HTML, CSS and JavaScript."
  '''
  text: ->
    p '''
      Brackets is a text-editor, built in HTML, CSS and JavaScript.</br>
      A technology called <a href="https://github.com/adobe/brackets-shell">brackets shell</a> (similar to <a href="https://github.com/rogerwang/node-webkit">node-webkit</a>) is used to create the desktop application with web technologies.</br>
      Adobe released the version 1.0 in November 2014.
    '''
    p '''
      I switched from Netbeans and I really love Brackets.</br>
      It is fast (maybe not as fast as SublimeText) but it is free and it can be customized with a lot of extensions.</br>
      Especially, using <a href="https://github.com/zaggino/brackets-git">Brackets Git</a> extension, Git integration is awesome. For example you can push, pull, see "diff" in the code, right from the editor.</br>
      Among other useful features, the "LivePreview" feature fires a local web server than can serve any html page you are working on.</br>
      Since it is built in web technologies, you can debug the editor using Chrome debugger, so it is really tempting to create its own extensions!
    '''
  image: "brackets.jpg"

,

  title: "SemanticUI"
  url: "http://semantic-ui.com/"
  github: 'https://github.com/semantic-org/semantic-ui/'
  stars: 14012
  description: '''
     "A highly-themable UI framework with naming conventions built around common usage."
  '''
  text: ->
    p '''
      Semantic-UI is a set of more than 50 UI components to create beautiful web pages.<br/>
      The HTML mark-up aims to be as expressive as possible, hence the name "semantic".
    '''
    p ''' ->
      Not only the number of components, but also the number of variations for every component are amazing, the project is really thorough.<br/>
      The version 1.0 was released in November 2014 and the project keeps up growing at a fast pace.
    '''
  image: "semanticui.jpg"

,

  title: "Ionic framework"
  url: "http://ionicframework.com/"
  github: 'https://github.com/driftyco/ionic'
  stars: 12753
  description: '''
    "The beautiful, open source front-end SDK for developing hybrid mobile apps with HTML5."
  '''
  text: ->

    p '''
      In 2014 I discovered the concept of "hybrid application" and I built my first Android application using Ionic framework.<br/>
      Hybrid applications are built using web technologies (HTML5, CSS and JavaScript) instead of Objective C (for iOS) or Java (for Android).<br/>
      The communication with the device features is done using <a href="http://cordova.apache.org/">Cordova</a> plugins, that are simple dependencies you have to download for every system you target (mainly iOS and Android).
    '''
    p '''
      The concept is not new, <a href="http://phonegap.com/">PhoneGap</a>, for example, already wraps Cordova plugins.<br/>
      But what makes Ionic different, besides its beautiful design, is the fact that it is built on top of AngularJS framework.</br>
      So if you already know AngularJS, you will feel really comfortable with Ionic!
    '''
  image: "ionic.jpg"
]

intro = ->
  p '''
    The web landscape is evolving quickly so it is important to stay up-to-date about the latest technologies.
  '''
  p '''
    2013 was a watershed for me, I learned so many great things: node.js, AngularJS, Git, style pre-processors, CoffeeScript, Responsive Web Design...
  '''
  p '''
    So what did I find last year, in 2014 ? Here are my 3 picks...
  '''

div '.intro', ->
  div '.pure-g-r', ->
    div '.pure-u-2-3', ->
      div '.first-col', ->
        intro()
    div '.pure-u-1-3', ->
      div '.second-col', ->
        img src: @getPath('img/blog/' + @document.image)

for tool in tools
  div '.review-block', ->
    div '.pure-g-r', ->
      div '.pure-u-1-3', ->
        div '.first-col', ->
          a href: tool.url, ->
              img ".img-responsive.img-thumbnail", src: @getPath('img/blog/2015-01-bestof/'+tool.image), alt: tool.title
      div ".pure-u-2-3", ->
        div '.second-col', ->
          if false then p '.github', ->
            span tool.stars
            i '.fa.fa-star',''
            span ' on '
            a href: tool.github, ->
              text 'GitHub'
              i '.fa.fa-github',''
          a '.heading', href: tool.url, ->
              h2 tool.title
          strong tool.description
          p tool.text
          if tool.text2
            p tool.text2
          if tool.points
            p 'What I like:'
            ul '.custom', ->
              for point in tool.points
                li point
