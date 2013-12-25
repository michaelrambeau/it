---
layout: 'default'
title: 'My projects'
description: "Michael Rambeau's IT projects"
menuId: 'APPS'
standalone: true
className: 'projects'
slimbox: true
js: ['projects.js']
---

if false
  div '.visible-xs','visible-xs'
  div '.visible-sm','visible-sm'
  div '.visible-md','visible-md'
  div '.visible-lg','visible-lg'
  
  
docStory = @getCollection('documents').findAllLive({relativeOutDirPath:'posts',key:'remit-story'}).toJSON()[0];
urlStory = @getPath(docStory.url)

apps = [
  id: 'brastelremit2'
  title: 'Brastel Remit Responsive design prototype'
  sidebarTitle: 'Brastel Remit Responsive'
  customer: 'Brastel Telecom'
  year: 2013
  image: ['imt2/brastelremit2-home.png']
  url: 'http://michaelrambeau.com/it/projects/brastelremit'
  buttonText: 'View the online demo'
  context: (link = urlStory ) ->
    p """
      I was in charge of brastelremit.jp web site (an internatonal money transfer service)
      I made a proposal to make the web site mobile-friendly (Read more about the making-of this project <a href="#{link}">here</a>)
    """
  work: ->
    p '''
     I made a prototype of a mobile-friendly web, using "Responsive design" concepts: 
      one website that suits all shapes, sizes and interaction.
      Depending on the device screen, the same page behaves differently.
    '''
  technologies:[
    'Bootstrap : a set of HTML5 components perfect for creating responsive web sites'
    ,
    'Docpad : a site generator based on node.js'
    ,
    'CoffeeScript/CoffeeKup : the templating language used to create pages'
  ]
,
  id: 'brastelremit1'
  title: 'Brastel Remit first version'
  sidebarTitle: 'Brastel Remit V1'  
  customer: 'Brastel Telecom'
  year: 2012
  image: ['imt1/brastelremit1-home-big.jpg']
  url: 'http://brastelremit.jp'
  buttonText: 'Visit the web site'
  description: ->
    p '''
      Brastel Remit is an international money transfer service released in March 2012.
      I did the main web site and the customer web site.
    '''
    p '''
      I created all pages of Brastel Remit web site:
      I implemented the layout provided by the Design team (using XHTML and jQuery).</br>
      I made the page dynamic using web services provided by the System team (XSL - XML).    
    '''
  technologies:[
    'XSL - XML'
    'jQuery'
  ]
,  
  id: 'teamcalendar'
  title: 'Team Calendar',
  customer: 'Air France'
  year: 2010
  image: ['teamcalendar/teamcalendar-big.jpg','teamcalendar/teamcalendar-popup.jpg']
  url: ''
  context: ->
    p '''
      TeamCalendar is an online calendar that shows working schedule and days off of all team members in order to better coordinate project activities.
    '''
  work: ->
    p '''
      I designed a new version to solve the performance problems of the old one (response time was too long).
      The application uses Ajax requests to make the calendar display faster.
    '''
    p '''
      The User Interface was simplified : for example the user has just to click on a calendar cell to create an entry.  
    '''
  technologies:[
    'CakePHP for the demo version'
    'Lotus Notes Domino for the intranet version'
  ]  
,  
  id: 'eletter'
  title: 'e-letter',
  customer: 'Air France'
  year: 2009
  image: ['eletter/eletter-klm-big.jpg','eletter/eletter-view-big.jpg','eletter/eletter-document-big.jpg']
  url: ''
  context: ->
    p '''
      E-letter is a mass-mailing application to send newsletters to all Air France employees (about 40,000 addresses).
    '''
    p '''
      The first version of E-letter was only for Air France employees who use Lotus Notes.
    '''
    p '''
      Unfortunately the mails were not compatible with other mails clients : Microsoft Outlook, webmails used by KLM staff... a new version was needed !
    '''
  work: ->
    p '''
      I made a new version using a web standard format for the mails : HTML MIME.
    '''
    p '''
      This application is a kind of CMS that generates mails in HTML MIME format:
      The users creates a newsletter by adding "blocks" of content that can be : title, pictures, paragraphs and so on.
    '''
    p '''
      Mail can be sent at any time or scheduled (i.e. an economic report is sent every month to all employees).
    '''
  technologies:[
    'Lotus Notes Domino R6.5'
    'HTML MIME'
  ]  
,  
  id: 'eslots'
  title: 'e-slots',
  customer: 'Air France'
  year: 2007
  image: ['eslots/eslots-view-big.jpg','eslots/eslots-record-big.jpg','eslots/eslots-popup.jpg']
  url: ''
  context: ->
    p '''
      Air France Cargo carries freight all over the world by plane but also by truck.
    '''
    p '''
      When goods arrive at the Paris CDG airport, the trucks are loaded in parking places called "slots".
      The slots are reserved for only 30 minutes.
      Air France Cargo needed a new application to manage these slots.    
    '''
  work: ->
    p '''
      I designed and developed the application from start to finish, allowing users to manage slots.
      The main page is a calendar, showing the real-time availability of each slot. Users can book a slot in real time, by selecting the date and time in the calendar.
    '''
    p '''
      In special cases, for instance if there is no available slot left, "extra slots" can be requested (via an approval workflow). 
      Users also get information about all events by accessing a special mailbox, included within the application.
    '''
  technologies:[
    'Lotus Notes Domino, web and Notes client'
  ]  
]



#Helpers

getBigImage = (image) ->
  if /.*\-small\..*/.test(image) is true
    urlBig = image.replace(/(.*)\-small\.(.*)/ , "$1-big.$2")
  else
    urlBig = image
  return urlBig
  
#Template  


#text @nd(@document)

div '.row', ->
  div '.col-lg-3.visible-lg', ->
    div '.bs-sidebar', role: "complementary", ->
      ul '.nav.bs-sidenav', ->
        for app in apps
          li ->
            a href: '#'+app.id, if app.sidebarTitle then app.sidebarTitle else app.title    
    
    
  div '.col-lg-9', ->
    i=0
    for app in apps
      i++
      div '.row.project', ->
        div '.col-sm-8', ->
          h2 '#' + app.id, app.title
          p '.customer', app.year + ' - ' +'Customer: ' + app.customer
          if app.description
            p app.description
          if app.context
            h3 'Context'
            app.context()
          if app.work
            h3 'What I did'
            app.work()
          h3 'Technologies'
          ul '.custom', ->
            for techno in app.technologies
              li techno
          unless app.url is ""          
            p ->
              a '.btn.btn-primary', href: app.url, target: '_blank', ->
                text app.buttonText
        div '.col-sm-4', ->
          for image in app.image
            path="img/screenshots/"
            if app.url isnt ''
              a 'href': app.url, target: '_blank', ->
                img '.img-responsive.thumbnail', src: @getPath(path + image)
            else
              urlBig = getBigImage(image)
              a 'href': @getPath(path + urlBig), target: '_blank', 'rel': 'lightbox-screeshots', title: app.title + ' - screenshot', ->
                img '.img-responsive.screenshot.thumbnail',src: @getPath(path + image)
                br()            
      hr() unless i is apps.length  

  
