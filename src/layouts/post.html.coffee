	---
	layout: 'default'
	---
	div '.container.main', ->
		div '.white-block', ->
			div '.title', ->
				div '.post-date.hidden-print', @getMonth(@document.date) + ' '+ @document.date.getFullYear()
				h1 '.post-title', @document.title
				text @content
				
		if @document.comments is true
			div '.hidden-print', ->
				text @partial 'disqus'