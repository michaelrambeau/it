	---
	layout: 'default'
	---
	div '.container.main', ->
		h1 @document.title unless @document.noTitle is true
		text @content