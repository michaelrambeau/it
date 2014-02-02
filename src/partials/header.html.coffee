selectedClass = 'pure-menu-selected'
header '.hidden-print', ->
	div '.container', ->
		div '.pure-menu.pure-menu-open.pure-menu-horizontal.navigation', ->
			#img.pure-menu-headingX.pure-hidden-phone(src="http://michaelrambeau.com/it/img/mr.png",width=200)
			ul ->
				li class: (if @document.menuId == 'HOME' then selectedClass else ''), ->
					a href: @getPath(''), ->
						i '.fa.fa-home.pure-hidden-desktop',''
						span '.pure-hidden-phone', ' Home'
				li class: (if @document.menuId == 'APPS' then selectedClass else ''), ->
					a href: @getPath('projects'), -> 'Projects'
				li class: (if @document.menuId == 'EXPERIENCE' then selectedClass else ''), ->
					a href: @getPath('resume'), -> 'Resume'
				li class: (if @document.menuId == 'POSTS' then selectedClass else ''), ->
					a href: @getPath('posts'), -> 'Posts'
			ul '.social.pure-hidden-phone', ->
				li ->
					a target: "_blank", href: "http://www.facebook.com/profile.php?id=525808362", title: "View Michael Rambeau's profile on Facebook", ->
						i '.fa.fa-facebook',''
				li ->
					a target: "_blank", href: "https://plus.google.com/115589168984238296965", rel:"publisher", title: "View Michael Rambeau's profile on Google+", ->
						i '.fa.fa-google-plus',''
				li ->
					a target: "_blank", href: "https://github.com/michaelrambeau", title: "View Michael Rambeau's profile on GitHub", ->
						i '.fa.fa-github',''
				li ->
					a target: "_blank", href: "http://www.linkedin.com/in/michaelrambeau", title: "View Michael Rambeau's profile on Linkedin", ->
						i '.fa.fa-linkedin',''

