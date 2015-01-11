---
layout: 'review'
title: 'The tools I use for web development'
description: 'Some feedback about 4 tools I discovered recently: Bootstrap, Docpad, Angular and LESS'
date: '2013-08-26'
menuId: POSTS
comments: true
active: true
homepage: false
standalone: true
image: 'lego-minifig-400px.jpg'
---

tools=[
	title: "Bootstrap"
	url: "http://www.getbootstrap.com"
	description: "A set of UI components to create responsive web site (html5, css and js)"
	text: @partial 'subdocuments/bootstrap.html' 
	points:[
		'Everything I need to create a "responsive" web site is in the box!'
		,
		'Javascript conponents such as drop-down menu are very easy to use: just copy the HTML mark-up in the page and it works, no need to bind any DOM element with a Javascript call.'
		,
		'The flat design (no gradient, no shadow) is nice and simple'
		,
		'CSS built with LESS, easy to customize'
	]
	image: "bootstrap.png"
	
, 

	title: "Docpad"
	url: "http://www.docpad.org"
	description: "A tool to create easily a full web site, based on node.js"
	text: @partial 'subdocuments/docpad.html'
	points:[
		"Very light, perfect to have one's web project on an USB key for example"
		"Works with several languages, you just need to install the right plugin"
		"Made me discover Coffeekup (a templating language built on top of CoffeeScript)"
	]
	image: "docpad.png"
	
, 

	title: "Angular"
	url: "http://angularjs.org/"
	description: 'A javascript framework to build easily dynamic applications'
	text: @partial 'subdocuments/angular.html'
	image: "angular.png" 
	points: [
		"Works with an expressive HTML markup, no templating system required"
		"Perfect for a one-page application driven by ajax"
	]
,

	title: "LESS"
	url: "http://www.lesscss.org"
	description: 'A language to write CSS code in a clean and eficient way.'

	text: ->
		p '''
			The main problem of CSS is that there is a lot of repetitions: when you create a web site, you usually start with a simple CSS file, and then you keep adding lines, repeating selector, overwriting things, sometimes by accident, sometimes on purpose...	
		'''
		p '''
		LESS provides several solutions to keep your code clean and tidy: variabes, mixins, nested elements...
		'''
		p '''
		It looks like a smart evolution of CSS rather than a new language, since you can include basic CSS in your LESS code.
		'''
		p '''
		In my development process, I use a <a href="http://gruntjs.com/">Grunt</a> task to create a single CSS file from my LESS files.
		'''
		p '''
		<a href="http://learnboost.github.io/stylus/">Stylus</a> can be a better alternative because of its compact syntax: no more curly bracket, indentation is used to create nested elements. 
		However, I chose LESS because Bootstrap components are built with LESS.
		'''
		
	points:[
		"No more duplication of selectors... it makes the stylesheet easier to read and to write"
		"Media-queries (used to define style dependng on the screen device, for example) can be nested inside elements, which means it is easy to define how a given element behaves depending on the context (mobile, desktop, print...)"
	]
	image: "less.png"
]

intro = () ->
	p -> '''
		Of course front-end development can be done the same way as in the early 2000s:
		HTML, Javascript and CSS, the 3 basic ingredients, were already available.
		<br/>
		It is especially true if you have to deal with old browsers that do not know HTML5.
		<br/>
		But I found recently some tools that really help me doing better work.
	'''

	blockquote -> 
		p '''
			Development is a craftsmanship. Good craftsmen need good tools.
		'''
		small '''
			A quote found somewhere in the web but I can't remember where
		'''

div '.intro', ->
	div '.pure-g-r', ->
		div '.pure-u-2-3', ->
			div '.first-col', ->
				intro()
		div '.pure-u-1-3', ->
			div '.second-col', ->
				img src: @getPath('img/blog/' + @document.image)

i = 0
for tool in tools
	i++
	div '.review-block', ->
		div '.pure-g-r', ->
			div '.pure-u-1-3', ->
				div '.first-col', ->
					a href: tool.url, ->
							img ".img-responsive.img-thumbnail", src: @getPath('img/blog/tools/'+tool.image), alt: tool.title
			div ".pure-u-2-3", ->
				div '.second-col', ->
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

