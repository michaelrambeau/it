--- cson
layout: 'review'
title: 'Deploy a node.js application: which host to use ?'
description: "With node.js, it is easy to create one's own web server that runs locally. But when you want to deploy your application, which host to choose ?"
date: '2014-08-14'
menuId: 'POSTS'
comments: false
active: true
homepage: true
standalone: true
angular: false
syntaxHighlighter: true
image:
	url: 'http://res.cloudinary.com/michaelrambeau/image/upload/v1408057146/2014-08-nodejs-wallpaper.jpg'
---

hosts = [
	#1. HEROKU
	name: 'Heroku'
	url: 'https://www.heroku.com/'
	image: 'http://res.cloudinary.com/michaelrambeau/image/upload/v1408057146/2014-08-heroku-dashboard.jpg'
	docs: 'https://devcenter.heroku.com/articles/getting-started-with-nodejs'
	setup: () ->
		p 'First, you have to download and install "Heroku Toolbelt" program on your computer, to be able to call heroku commands from the command prompt window.'
		p 'Then login using <code>heroku login</code> command, a SSH key file will be created on your computer.'
		p 'Create a file named <code>.profile</code> at the root of your application, to specify which file has to be runned by node.js to launch the application.'
		p 'Last step: run a process on the server to launch the application: <code>heroku ps:scale web=1</code>'
	deploy: () ->
		p 'Concept: you deploy to Heroku by pushing your code files to a special Git repository. From Git, you will have to create a "remote" repository, usually called "heroku": <code>git remote add heroku your_git_URL.git</code> .'
		p 'To deploy, all you have to do is push the files to the remote repository you have just created: <code>git push heroku master</code>'
				
		p '.small', '''
			I tried to create an account using an email address that was different than the one that is associated with my GitHub account and I had trouble 		related to "SSH keys" installed on my computer, I could not "push" my files.
			Heroku repository is different from GitHub repository so it should work with any account.
			I could not solve the problem so I tried to create an other account, using my GitHub account email and it worked.
		'''
	pros: [
		'Single-command deploy process (git push heroku master)'
		'Nice URLs http://yourapp.herokuapp.com'
		'Environment variables (used to store data you don\'t want store in Git, like database passwords...) are easy to set up from the dashboard.'
	]
	cons: [
		'The server fall asleep after one hour of inactivity, it takes about 5 seconds to awake it.'
		'You may encounter some issues if you try to use an email address that is different from your GitHub account one.'
	]

,	

	#2. MODULUS
	name: 'Modulus'
	url: 'http://modulus.io/'
	image: 'http://res.cloudinary.com/michaelrambeau/image/upload/v1408057146/2014-08-modulus-dashboard.jpg'
	docs: 'https://modulus.io/codex/getting_started'
	setup: () ->
		p 'Step 1: install "modulus" globally from npm <code>npm install -g modulus</code>'
		p 'Step 2: login to GitHub <code>modulus login --github</code>'		
	deploy: () ->
		p 'To push the your code to Modulus, you just have to run the "deploy" command: <code>modulus deploy</code>. The "deploy" command pushes your code, updates the project dependencies (running a npm "install" command) and automatically restarts the application.'
	pros:[
		'Very simple "install" process using only npm, nothing to download and install manually.'
		'Super fast response time. The server is responsing faster than my local server!'
	]
	cons:[
		'Only the first month is free of charge ?'			
	]
				
,		

	#3 CLOUD 9
	name: 'Cloud9'
	url: 'http://c9.io'
	image: 'http://res.cloudinary.com/michaelrambeau/image/upload/v1408059839/2014-08-c9.jpg'
	intro: () ->
		p 'Cloud9 is a very powerful online IDE (it runs in the browser) that lets you develop your application from anywhere. You can also use it to "share" your application since anyone can access the application URL.'
	deploy: () ->
		p 'With cloud9, you take control of the server from your browser. For example, you can run by yourself npm commands. Since Git is installed on the server, to deploy your application, you just have to pull the content from GitHub.'
	pros:[
		'Nothing to install on your computer, everything is in the cloud'
		'Very flexible, you can set up several "running configurations" to simulate different enviroments.'
	]
	cons: [
		'Can be used only for tests, the server "hibernates" after some days of inactivity.'
		'Slower than the previous hosts.'
	]
	
]


#PAGE MARK UP

div '.intro', ->
	div '.pure-g-r', ->
		div '.pure-u-3-5', ->
			p "With node.js, it is really easy to run one's web server locally."
			p "But if you want to make your node.js application available for all web users, which solution to choose ?"
			p '''
				Here are my requirements. It has to be:
			'''
			ul ->
				li 'Fast'
				li 'Easy to use (especially the deploy process)'
				li 'Free (no credit card required!)'
				#li 'socket.io support would be a great plus, if we build real-time application'

			p "I have checked 3 solutions for you: 2 host companies (Heroku and Modulus) and one IDE in the cloud."
		div '.pure-u-2-5', ->
			img '.img-responsive', src: @document.image.url



for host in hosts
	div '.review-block', ->	
		div '.pure-g-r', ->
			div '.pure-u-1-3', ->
				if host.image
					img '.img-responsive', src: host.image, alt: host.name			
			div '.pure-u-2-3', ->		
				div '.second-col', ->
					a '.heading', 'href': host.url, ->
						h2 host.name		
					if host.intro then host.intro()

					if host.setup
						h3 'Setup overview '
						host.setup()
						p "More details <a href=\"#{ host.docs }\">here</a> (official website)"
						

					h3 'Deploy process'
					host.deploy()

					h3 'Pros and cons'
					div '.pros-cons', ->
						if host.pros
							div '.table-layout.pros', ->
								div '.icon', '', ->
									i '.fa.fa-plus', ''
								div ->
									ul ->
										for pro in host.pros
											li pro
						if host.cons
							div '.table-layout.cons', ->
								div '.icon', '', ->
									i '.fa.fa-minus', ''
								div ->
									ul ->
										for con in host.cons
											li con


					