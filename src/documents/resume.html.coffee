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
  id: 'FIRSTSERVER'
  title: 'Web developer / UI-UX specialist at FirstServer'
  from: '2014'
  to: 'Present'
  location: 'Osaka, Japan'
  resp: '''
    Research and development about a Customer Portal web application UI/UX.
  '''
  points: [
    'Created a responsive prototype of customer portal application using Single Page Application architecture and React components'
    'Research and proposal to improve promotion web site eficiency and customer registration process'
    'Introduced JavaScript latest technologies into a Rails application: React, Redux, ES6, Unit testing'
  ]
,
  id: 'BRASTEL'
  title: 'Web developer at Brastel Telecom'
  from: '2011'
  to: '2014'
  duration: '3 years'
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
    'Maintained an application storing reports on interviews between employees and their managers, complete with secured access control.'
    'Built a workflow to fix issues that occurred with the switch to the Euro currency'
  ]
  sidebar: false

]

img '.pull-right', src: @getPath('img/photos/identite.jpg')
h1 'Full-stack web development expert'
ul '.reset', ->
  li ->
    i '.octicon.octicon-person',' '
    text 'Michael Rambeau, ' + @getAge() + ' years old, French, IT engineer'
  li ->
    i '.octicon.octicon-home',' '
    text 'Residing in Ibaraki city, Osaka, Japan since April 2010'
  li ->
    i '.octicon.octicon-mail',' '
    a '.email', href: "mailto:michael.rambeau@gmail.com", "michael.rambeau@gmail.com"
hr '.spacer', ''

h2 'Technical proficiencies'
ul '.custom', ->
  li 'Front-end: HTML5, JavaScript ES6, React, Redux, Webpack, CoffeeScript, AngularJS, jQuery, Bootstrap, CSS, LESS, Sass, Stylus'
  li 'Mobile: Responsive Web Design, web performance'
  li 'Unit testing: Mocha, Tape'
  li 'Back-end: node.js microservices, Express, Ruby on Rails, PHP (CakePHP), XML - XSL'
  li 'Applications and CMS: KeystoneJS, SailsJS, Docpad, Lotus Notes Domino, WordPress, Typo3'
  li 'Databases: MongoDB, MySQL, MS SQLServer'


h2 '.clearfix','style':'clear:both;','Professionnal experience'
for experience in experiences

  div '.experience', ->
    div '.pure-g', ->
      div '.pure-u-1-2', ->
        div '#' + experience.id + '.experience-date.text-left', ->
          year = if experience.from is experience.to then experience.from else experience.from + ' ⇒ ' + experience.to
          i ".octicon.octicon-calendar",''
          text year + (if experience.duration? then ' (' + experience.duration + ')' else '' )
      div '.pure-u-1-2', ->
        div '.experience-location', ->
          i ".octicon.octicon-globe",''
          text experience.location
    h3 experience.title

    if experience.resp
      p '.resp', experience.resp
    if experience.points
      if experience.resp
        p 'Key achievements:'
      ul '.custom', ->
        for point in experience.points
          li point

h2 'Education'

p '''
Bachelor's degree in Physics degree, University of Pau, France 1999
'''


