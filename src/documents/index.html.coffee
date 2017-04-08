---
layout: 'default'
title: 'Full-stack web engineer in Osaka, Japan'
description: 'Michael Rambeau, web development expert in Osaka, Japan. Specialities: HTML5, React, Redux, AngularJS, node.js microservices, Responsive Web Design, CSS, Sass.'
menuId: 'HOME'
standalone: true
className: 'home'
noTitle: true
---

#========
# DATA
#========
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
        li 'Strong background on XHTML, HTML5, JavaScript (AngularJS, ReactJS), CSS (LESS, Sass, Stylus)'
        li 'Experience in building mobile friendly applications using "responsive design" concept and Bootstrap components'
        li 'Able to quickly create web prototypes or mock-ups using site generators (docpad, Gulp).'
        li 'Enthusiastic about building dynamic and robust applications using Javascript frameworks like AngularJS or ReactJS'

,
  title: 'Back-end web development'
  content: ->
    ul '.custom', ->
      li 'node.js microservices, socket.io'
      li 'Ruby on Rails'
      li 'Work experience with XML - XSL : XSLT used to process XML data provided by web services to generate dynamic pages.'
      li 'PHP: CakePHP, YII frameworks'
      li 'Databases: MongoDB, MySQL, MS SQL Server'
,
  title: "Lotus Notes Domino"
  picture: 'notesdomino.png'
  content: ->
    div ->
      img '.pull-right','src': @getPath('img/logos/notesdomino.png'), 'alt': 'Lotus Notes Domino'
      small ->
        i '.fa.fa-info-sign',''
        text '''
          Lotus Notes Domino is an enterprise-level collaboration platform.
        '''
      ul '.custom', ->
        li '10-year experience in designing and developing intranet applications for both Notes and Web clients'
        li 'All steps of project life cycle : from preliminary studies and design to end-user support'
        li 'All kinds of applications : forum, workflows, calendars, mailboxes...'
]

#========
# TEMPLATES
#========

#1. PROFILE
templateProfile = () ->
  div ->

    a '#readmore-link', href: '#', 'Read more about me...'
    div '#readmore-content.slider.closed', ->
      ul '.custom', ->
        li 'Experience with project management, requirements gathering, solutions design, implementation and support'
        li 'Skills about both front-end and back-end development'
        li 'Detail-focused: writing clean and readable code to make maintenance easy with emphasis on performance'
        li 'Team player, good communication skills... communication is the key to successful projects!'
      p -> """
        Check <a href="#{@getPath('resume')}">my online resume</a> for more details.
      """
        #span ''
        #a '.pure-button.pure-button-primary', href: @getPath('resume'), 'Resume &raquo;'
        #span ' and contact me in English, French or Japanese.'


    a href: @getPath('japanese'), ->
      img '.flag', 'src': @getPath('img/flags/jp.png'), 'alt': 'Japanese', 'width': '36', 'height': '26'
      text '日本語 プロフィール'

    if false
      img src: @getPath('img/logos/html5.png'), alt: 'html5'
      img src: @getPath('img/logos/nodejs.png'), alt: 'nodejs'
      img src: @getPath('img/logos/angularjs.png'), height: 60, alt: 'angular.js'
      img src: @getPath('img/logos/coffeescript.png'), alt: 'CoffeeScript'
      img src: @getPath('img/logos/notesdomino.png'), alt: 'Lotus Notes Domino'



#CONTACT
templateContact= () ->
  h2 ->
    i '.octicon.octicon-mail', ''
    text 'Contact'
  div '.pure-g-r', ->
    div '.pure-u-1-2', ->
      a '.email', href: 'mailto:michael.rambeau@gmail.com', 'michael.rambeau@gmail.com'
    div '.pure-u-1-2', ->
      span '.social-links', ->
        a '.icon', target: "_blank", href:"http://www.linkedin.com/in/michaelrambeau", title: "View Michael Rambeau profile on Linkedin", ->
          img src: @getPath("img/logos/linkedin.png")
        a '.icon', target: "_blank", href:"http://www.facebook.com/profile.php?id=525808362", title: "View Michael Rambeau profile on Facebook", ->
          img src: @getPath("img/logos/facebook.png")
        a '.icon',  target: "_blank", href:"http://mixi.jp/show_profile.pl?id=30588844&from=navi", title: "View Michael Rambeau profile on Mixi", ->
          img src: @getPath("img/logos/mixi.png")

#SKILLS
templateSkills = () ->
  h2 '.skills', ->
    i '.mega-octicon.octicon-tools',''
    text 'Skills'
  if false then div '.logos', ->
    img src: @getPath('img/logos/html5.png'), alt: 'html5'
    img src: @getPath('img/logos/nodejs.png'), alt: 'nodejs'
    img src: @getPath('img/logos/angularjs.png'), height: 60, alt: 'angular.js'
    img src: @getPath('img/logos/coffeescript.png'), alt: 'CoffeeScript'

  div '#accordion.panel-group', ->
    for skill in skills
      div '.skill.block', ->
        h3 skill.title
        div '.body', ->
          div '.content', ->
            skill.content()

#GITHUB projects I follow
templateGithubProjects = () ->
  h2 ->
    i '.mega-octicon.octicon-mark-github',''
    text 'Main projects on Github'
  div '.block', ->
    div id: 'repos', 'Loading...'


#POSTS
posts = @getCollection('documents').findAllLive({relativeOutDirPath:'posts',homepage:true},[date:-1]).toJSON()
templatePosts = () =>
  h2 '.latest-posts', ->
    i '.mega-octicon.octicon-pencil',''
    text 'Latest posts'

  for doc in posts
    div '.block.post', ->
      #div '.date', @getMonth(doc.date) + ' '+ doc.date.getFullYear()
      h3 doc.title
      div '.body', ->
        if doc.image
          url = if doc.image.url then doc.image.url else @getPath('img/blog/'+doc.image)
          a href: @getPath(doc.url), title: doc.title, ->
            img '.img-responsive', src: url, alt: doc.title
        div '.content', doc.description
      div '.footer', ->
        a '.pure-button.pure-button-secondary', href: @getPath(doc.url), 'Read post &raquo;'
  div '.view-all', ->
    a '.pure-button.pure-button-primary', href: @getPath('posts'), ->
      text 'View all posts &raquo;'


#========
# MARKUP
#========

div '.banner', ->
  div '.container', ->
    div '.intro.main', ->
      img '.osaka', src:'img/photos/shinsekai.jpg', alt: 'Hello Osaka!'
      p '.hello', 'Hello, I am Michael Rambeau'
      h1 'IT solution developer and web expert in Osaka'
      p '.whoiam', '''
        I have been building intranet and web applications with enthusiasm and commitment since 2000.
      '''
      templateProfile()
      hr '.spacer', ''

div '.container.main', ->
  div '.pure-g-r', ->
    div '.pure-u-3-5', ->
      div '.first-col', ->
        templateSkills()
        templateGithubProjects()

    div '.pure-u-2-5', ->
      div '.second-col', ->
        templatePosts()

script ->
  # include doT templating engine
  text @partial 'dot.js'
  # Fetch starred projects and render the table in the page.
  text @partial 'homepage-scripts.js'

coffeescript ->
  #update 2015/01: no more "jQuery" dependency, to make the homepage page faster!
  #from the code used in Google Web startkit project
  query = document.querySelector.bind(document);
  link = query '#readmore-link'
  content = query '#readmore-content'
  toggleContent = (e) ->
    content.classList.toggle 'closed'
    e.preventDefault()
    false
  link.addEventListener 'click', toggleContent
  return
