---
layout: 'default'
title: 'IT solution developer and Web expert in Japan'
description: 'Michael Rambeau, web expert in Osaka, Japan. Specialities: HTML5, docpad, AngularJS, Responsive design, Bootstrap, Lotus Notes Domino'
menuId: 'HOME'
standalone: true
className: 'home'
---

#DATA
languages=[
  icon:'fr.png'
  name: 'French'
  level: 'Native speaker'
,
  icon:'en.png'
  name: 'English'
  level: 'Business level : TOEIC 960 points (2011)'
,
  icon:'jp.png'
  name: 'Japanese'
  level: 'Conversation level, JLPT N3 (2012)'
]

skills = [
  title: 'Front-end web development'
  content: ->
    div ->
      img '.img-responsive', 'src': @getPath('img/responsive-design.png'), 'alt': 'Responsive design'      
      ul '.custom', ->
        li 'Strong background on XHTML, HTML5, JavaScript (especially jQuery) and CSS'
        li 'Experience in building mobile friendly applications using "responsive design" concept and Bootstrap components'
        li 'Able to quickly create web prototypes or mock-ups using Docpad as a site generator and CoffeScript / CoffeeKup as templating system.'
        li 'Enthusiastic about building dynamic and robust applications using Javascript frameworks like Angular.js or backbone.'
      #img '.img-responsive', 'src': @getPath('img/responsive-design.png'), 'alt': 'Responsive design'      
      
,  
  title: 'Back-end web development'
  content: ->
    ul '.custom', ->
      li 'PHP framework : CakePHP, used for building Object-oriented applications'
      li 'Work experience with XML - XSL : XSLT used to process XML data provided by web services to generate dynamic pages.'
      li 'node.js used to run local web servers'
      li 'Database: MySQL, MS SQL Server'
,
  title: "Lotus Notes Domino"
  picture: 'notesdomino.png'
  content: ->
    div ->
      img '.pull-right','src': @getPath('img/logos/notesdomino.png'), 'alt': 'Lotus Notes Domino'
      small ->
        span '.glyphicon.glyphicon-info-sign',''
        text '''
          Lotus Notes Domino is an enterprise-level collaboration platform.
        '''
      ul '.custom', ->
        li '10-year experience in designing and developing intranet applications for both Notes and Web clients'
        li 'All steps of project life cycle : from preliminary studies and design to end-user support'
        li 'All kinds of applications : forum, workflows, calendars, mailboxes...'
]

#TEMPLATES
i = 0
accordionPanel = (title, content, open = false) ->
  i++
  div '.panel.panel-primary', ->
    div '.panel-heading', ->
      h4 '.panel-title', ->
        a '.accordion-toggle1', href: '#collapse'+i, 'data-toggle': 'collapse1', 'data-parent': '#accordion', ->
          text title
    div '#collapse'+i+'.panel-collapse1.collapse1'+(if i is 1 then '.in' else ''), ->
      div '.panel-body', ->
         content()

div '.row', ->
  div '.col-sm-7', ->
  
    #1. PROFILE
		#text @editable()
    h2 ->
      #span '.glyphicon.glyphicon-user',''
      text 'My profile in a few words'    
    p '''
      I have been building intranet and web applications with enthusiasm and commitment since 2000.
    '''

    ul '.custom', ->
      li 'Project management, requirements gathering, solutions design, implementation and support'
      li 'Skills about both front-end and back-end development'
      li 'Detail-focused : writing clean and readable code to make maintenance easy with emphasis on performance'
      li 'Team player, good communication skills... communication is the key to successful projects!'

    if false
      img src: @getPath('img/logos/html5.png'), alt: 'html5'
      img src: @getPath('img/logos/nodejs.png'), alt: 'nodejs'
      img src: @getPath('img/logos/angularjs.png'), height: 60, alt: 'angular.js'
      img src: @getPath('img/logos/coffeescript.png'), alt: 'CoffeeScript'
      img src: @getPath('img/logos/notesdomino.png'), alt: 'Lotus Notes Domino'

  div '.col-sm-5', ->
    #2. LANGUAGES
    
    h2 ->
      span '.glyphicon.glyphicon-globe',''
      text 'Languages'
    ul '.languages', ->
      for language in languages
        li ->
          div '.pull-left', ->
            img src: 'img/flags/'+language.icon, width:'30'
            text language.name
          div '.text', language.level
          
    if false 
      p ->
        a '.btn.btn-link.btn-lg', href: 'mailto:michael.rambeau@gmail.com', ->
          span '.glyphicon.glyphicon-envelope',''
          text 'michael.rambeau@gmail.com'
        a target: "_blank", href:"http://www.linkedin.com/in/michaelrambeau", title: "View Michael Rambeau profile on Linkedin", ->
          img src: @getPath("img/logos/linkedin.png")
        
    h2 ->
      span '.glyphicon.glyphicon-envelope',''
      text 'Contact'        
    div '.row', ->
      div '.col-md-6.contact', ->
        a '.email', href: 'mailto:michael.rambeau@gmail.com', 'michael.rambeau@gmail.com'
      div '.col-md-6', ->
        span '.social-links', ->
          a target: "_blank", href:"http://www.linkedin.com/in/michaelrambeau", title: "View Michael Rambeau profile on Linkedin", ->
            img src: @getPath("img/logos/linkedin.png")
          a target: "_blank", href:"http://www.facebook.com/profile.php?id=525808362", title: "View Michael Rambeau profile on Facebook", ->
            img src: @getPath("img/logos/facebook.png")
          a target: "_blank", href:"http://mixi.jp/show_profile.pl?id=30588844&from=navi", title: "View Michael Rambeau profile on Mixi", ->
            img src: @getPath("img/logos/mixi.png")      
    
div '.row', ->
  div '.col-sm-7', ->
  
    #3. SKILLS
    h2 ->
      #span '.glyphicon.glyphicon-wrench',''
      text 'Skills'
    div '#accordion.panel-group', ->
      for skill in skills
        #accordionPanel skill.title, skill.content
        if true
          h3 skill.title
          skill.content()
          hr()
        if false
          div '.panel.panel-primary', ->
            div '.panel-heading', skill.title
            div '.panel-body', skill.content
        
        
  div '.col-sm-5', ->
      #4. POSTS
      h2 ->
        span '.glyphicon.glyphicon-pencil',''
        text 'Latest posts'
      
      docs = @getCollection('documents').findAllLive({relativeOutDirPath:'posts',active:true},[date:-1]).toJSON()
      
      div '.list-group', ->
        for doc in docs
          a '.list-group-item', href: @getPath(doc.url), ->
            div '.post-date.pull-left', ->
              div '.month', @getMonth doc.date
              div '.day', @getDate doc.date
            h4 '.list-group-item-heading', doc.title
            p '.list-group-item-text.post-introduction', doc.description
            if doc.image
              extension = doc.image.substr(doc.image.length - 4,4)
              className = ''
              if extension is '.jpg'
                className = '.img-thumbnail'
              img '.img-responsive' + className, src: @getPath('img/blog/'+doc.image)
#docs = @getCollection('documents').findAllLive({relativeOutDirPath:'posts',active:true},[date:-1]).toJSON()
#text nd.dump(docs[0])