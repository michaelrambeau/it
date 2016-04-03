#docStory = getCollection('documents').findAllLive({relativeOutDirPath:'posts',key:'remit-story'}).toJSON()[0];
#urlStory = getPath(docStory.url)

apps = [
  id: 'brastelremit2'
  title:
    eng: 'Brastel Remit Responsive design prototype'
    jpn: 'brastelremit.jp リニュアル'
  sidebarTitle: 'Brastel Remit Responsive'
  customer: 'Brastel Telecom'
  year: 2013
  image: ['imt2/brastelremit2-home.png']
  url: 'http://projects.michaelrambeau.com/brastelremit'
  buttons: [
    text:
      jpn: '最初のプロトタイプ'
    url: 'http://projects.michaelrambeau.com/brastelremit'
  ,
    text:
      jpn: ' WEBサイト'
    url: 'http://brastelremit.jp/jpn/home'
  ]
  buttonText: 'View the online prototype'
  text:
    jpn: 'モバイルユーザー向けについて　研究、提案、開発。</br>2014年7月　WEBサイトのリニュアルをリリース。'
  context: (link = urlStory ) ->
    p """
      I was in charge of <a href="http://brastelremit.jp">brastelremit.jp</a> web site (an internatonal money transfer service).
      I made a proposal to make the web site mobile-friendly, using "Responsive Web Design" ideas.
    """
  work: ->
    p '''
     I made a prototype of a mobile-friendly web, using "Responsive design" concepts:
      one website that suits all shapes, sizes and interaction.
      Depending on the device screen, the same page behaves differently.
    '''
  technologies:[
    'Bootstrap'
    ,
    'Responsive Web Design'
    ,
    'LESS'
  ]
,
  id: 'asissonlinestore'
  enabled: false
  title:
    eng: 'Asics online store prototype'
    jpn: 'Asics オンラインストア プロトタイプ'
  sidebarTitle: 'Asics online store'
  customer: 'Asics'
  year: 2014
  image: ['asics/asics-mobile-1.jpg','asics/asics-mobile-2.jpg','asics/asics-tablet.jpg','asics/asics-desktop.jpg']
  url: 'http://projects.michaelrambeau.com/asics'
  buttonText: 'View the online demo'
  text:
    jpn: '求人に応募する際、モバイルユーザー向けオンラインストアのプロトタイプを作成。'
  context: (link = urlStory ) ->
    p """
      A demonstration of how "Responsive Web Design" could be used with an e-commerce website, using Asics catalogue.
    """
  work: ->
    p '''
     This prototype of e-commerce web site has been designed to deliver users a great experience, no matter the device they use.
    '''
    p '''
      The content (about 800 items) has been imported from the real Asics web site to a MongoDB database, using nodejs server.
    '''

    h3 'Features'
    ul ->
      li '800 sport items imported from the real Asics web site'
      li 'Super fast search engine to search by gender, sport, category and keyword'
      li '3 different layouts to make the best of all devices: mobiles, tablets and desktops'


  technologies:[
    'AngularJS framework'
    ,
    'CoffeeScript'
    ,
    'node.js on Heroku'
    ,
    'MongoDB database'
  ]
,
  id: 'brastelremit1'
  title:
    eng: 'Brastel Remit first version'
    jpn: 'brastelremit.jp WEBサイト'
  sidebarTitle: 'Brastel Remit V1'
  customer: 'Brastel Telecom'
  year: 2012
  image: ['imt1/brastelremit1-home-big.jpg']
  url: 'http://projects.michaelrambeau.com/brastelremit-v1/'
  buttonText: 'View the online demo'
  text:
    jpn: '2012年　新しい海外送金サービスのリリースのため、すべてのページを作成。'
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
    'XHTML, CSS'
    'XSL - XML'
    'jQuery'
  ]
,
  id: 'teamcalendar'
  title:
    eng: 'Team Calendar'
    jpn: 'AirFrance TeamCalendar 【イントラネット】'
  customer: 'Air France'
  year: 2010
  image: ['teamcalendar/teamcalendar-big.jpg','teamcalendar/teamcalendar-popup.jpg']
  url: ''
  text:
    jpn: '社員・チームメンバーの出張や研修、休暇等を管理するツールの開発。'
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
    'HTML'
    'Javascript, Ajax'
    'Lotus Notes Domino'
  ]
,
  id: 'eletter'
  title: 'e-letter',
  customer: 'Air France'
  year: 2009
  enabled: false
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
  title:
    eng: 'e-slots',
    jpn: 'AirFrance e-slots 【イントラネット】'
  customer: 'Air France'
  year: 2007
  image: ['eslots/eslots-view-big.jpg','eslots/eslots-record-big.jpg','eslots/eslots-popup.jpg']
  url: ''
  text:
    jpn: 'AirFranceのカーゴトラック（運搬車両）の出発・到着のスケジュール表のプログラム及びデザイン開発。'
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
    'Lotus Notes Domino'
    'HTML'
    'JavaScript'
  ]
]

module.exports.projects = apps
