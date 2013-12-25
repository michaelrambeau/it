doctype 5
html lang: 'en', ->
	head ->
		meta charset: 'utf-8'
		meta name: 'viewport', content: 'width=device-width, initial-scale=1'
		link rel: 'stylesheet', href: '/css/main.css' 
	body ->
		
		text @partial 'header.html'
		
		div '.container', ->
			div '.page-content', ->
			
				div '.title', ->
					div '.post-date', ->
						div '.month', @getMonth @document.date
						div '.day', @getDate @document.date
					h1 @document.title
				div '.clearfix', ->
					@content
				
			text @partial 'disqus'
		
		text @partial 'footer.html'		
				
		script src: '/vendor/jquery.min.js'
		script src: '/vendor/bootstrap.min.js'
		