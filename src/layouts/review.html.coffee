	---
	layout: 'default'
	---
	
#div '.review-header', ->			
div '.container.main', ->
	div '.review-header', ->
		div '.post-date.hidden-print', @getMonth(@document.date) + ' '+ @document.date.getFullYear()
		h1 '.post-title', @document.title

div '.container.main.review', ->
	text @content

	if @document.comments is true
		div '.hidden-print', ->
			text @partial 'disqus'