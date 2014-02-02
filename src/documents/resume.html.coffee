---
layout: "page"
title: "Resume"
description: "Michael Rambeau's curriculum vitae"
menuId: "EXPERIENCE"
standalone: true
noTitle: true
className: 'resume'
---
#require('nodedump')

experiences=[
  id: 'BRASTEL'
  title: 'Web developer at Brastel Telecom'
  from: '2011'
  to: 'Present'
  duration: '2 years'
  location: 'Osaka, Japan'
  resp:'''
    In charge of the <a href="http://brastelremit.jp">brastelremit.jp</a> web site, a money transfer service from Japan to locations overseas that was launched in March 2012.
  '''
  points:[
    'Created all pages of the Brastel Remit web site: implemented the layout provided by the Design team (XHTML) and made the page dynamic using web services provided by the System team (XSL - XML).'
    'Spearheaded changes to make the web site "mobile-friendly" using the "responsive design" approach'
    'Coordinated between the design and system teams in order to implement dynamic pages'
    'Maintenance and updates to the Brastel Telecom website (international calling services)'
  ]
,
  id: 'FREELANCE'
  title: 'Freelance web developer'
  from: '2010'
  to: '2011'
  duration: '1 year'
  location: 'Osaka, Japan'  
  points:[
    'Maintenance and evolution of a CRM application built using the open-source Vtiger CRM, PHP, MySQL and Ajax'
    'Design of a school new web site, using WordPress and jQuery plugins'
  ]
,  
  id: 'AIRFRANCE'
  title: 'Lotus Domino expert at Air France'
  from: '2004'
  to: '2010'
  duration: '6 years'
  location: 'Toulouse, France'  
  resp:'''
    In charge of the development and the maintenance of a pool of intranet web applications powered by Lotus Notes Domino.
  '''
  points:[
    'Web Toolkit Project : design of web components using Ajax technology for Air France developers'
    'Support and Assistance for Air France developers.'
    'e-letter Project : mass-mailing application using HTML MIME format to send a newsletters to all AirFrance employees.'
    'e-slots Project : a new application allowing users to manage departures and arrivals of Air France Cargo trucks.'
    'Taught courses on best practices for developing web applications with Lotus Notes Domino'
  ]
,  
  id: 'CCR'
  title: 'Notes developer at Caisse Centrale de Réassurance (reinsurance company)'
  from: '2001'
  to: '2004'
  duration: '3 years'
  location: 'Paris, France'  
  points:[
    'CAP Project : Customer Relationship Manager integrated into users\' mailboxes, automatic archive from mailbox.'
    'Company Shared Agenda integrated with personal user agendas.'
    'Log Analysis : application for Lotus Notes Administrators with daily scheduled agents sending e-mails.'
  ]
  sidebarTitle:'2001 and before'
,  
  id: 'GPA'
  title: 'Lotus Notes developer at GPA (insurance company)'
  from: '2001'
  to: '2001'
  duration: '7 months'
  location: 'Paris, France'  
  points:[
    'Maintained a database storing reports on interviews between employees and their managers, complete with secured access control.'
    'Euro Anomalies Manager: built an application complete with workflow to fix issues that occurred with the switch to the Euro currency'
  ]
  sidebar: false
  
]
  
img '.pull-right', src: @getPath('img/photos/identite.jpg')
h1 'IT solution developer & Web expert'  
ul '.reset.custom', ->
  li ->
    i '.fa.fa-user',' '      
    text 'Michael Rambeau, 36 years old, French, IT engineer'
  li ->
    i '.fa.fa-home',' '
    text 'Residing in Ibaraki city, Osaka, Japan since April 2010'
  li ->
    i '.fa.fa-envelope',' '
    a '.email', href: "mailto:michael.rambeau@gmail.com", "michael.rambeau@gmail.com"  
hr '.spacer', ''

h2 'Technical proficiencies'
ul '.custom', ->
  li 'Languages: HTML5, CSS, LESS, Stylus, Javascript, CoffeeScript, PHP, Lotus script, XML - XSL'
  li 'Frameworks and libraries: Bootstrap, jQuery, YUI, AngularJS, CakePHP'
  li 'Servers: node.js'
  li 'Applications and CMS: Lotus Notes Domino, Docpad, WordPress, Typo3'
  li 'Databases: MongoDB, MySQL, MS SQLServer'



h2 '.clearfix','style':'clear:both;','Professionnal experience'
for experience in experiences

  div '.experience', ->
    div '.pure-g-r', ->
      div '.pure-u-1-2', ->
        div '#' + experience.id + '.experience-date.text-left', ->
          year = if experience.from is experience.to then experience.from else experience.from + ' ⇒ ' + experience.to
          text year + ' (' + experience.duration + ')'        
      div '.pure-u-1-2', ->
        div '.experience-location', ->
          i ".fa.fa-globe",''
          text experience.location
    h3 experience.title

    if experience.resp
      p '.resp', experience.resp

    p 'Key achievements:'       
    ul '.custom', ->
      for point in experience.points
        li point
    #hr();    

h2 'Education'

p '''
Bachelor's degree in Physics degree, University of Pau, France 1999
'''
  

