	---
	layout: 'default'
	---

		
	div '.container.main', ->
		div '.white-block', ->
			div '.title', ->
				if @document.lastUpdate 
					div '.post-date.hidden-print', ->
						text 'Last updated in ' + @getMonth(@document.lastUpdate.date) + ' '+ @document.lastUpdate.date.getFullYear()
						text ' : ' + @document.lastUpdate.comment
				else
					div '.post-date.hidden-print', @getMonth(@document.date) + ' '+ @document.date.getFullYear()
				h1 '.post-title', @document.title
				if @document.hasPicture
					div '.pure-g-r', ->
						div '.pure-u-3-5', ->
							text @content
						div '.pure-u-2-5', ->
							img '.img-responsive', src: @getPath('img/blog/'+@document.image)
				else
					text @content
				
		if @document.comments is true
			div '.hidden-print', ->
				text @partial 'disqus'