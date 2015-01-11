--- cson
layout: 'post'
title: 'Bootstrap + CoffeeKup cheatsheet'
description: 'Bootstrap is a set of amazing UI components for HTML pages.	You will find here CoffeeKup snippets to include Bootstrap v3 components in your page: dropdown menus, tabs, navigation bars, and more... '

#introduction: '<a href="http://coffeekup.org/">Coffeekup</a> is built on top of <a href="http://coffeescript.org/">CoffeeScript</a>. It makes html code easy to read and to write: no HTML tags to open and to close, indentation is used to create nested elements.'
date: '2013-09-20'
menuId: 'POSTS'
active: true
homepage: false
standalone: false
angular: true
controller: 'StyleCtrl'
bootstrap: true
isPost: true
comments: true
className: 'bootstrap'
js: ['cheatsheet.js','holder.js']
syntaxHighlighter: true
image: '2013-09-bootstrap-coffeekup.jpg'
lastUpdate:
	date: new Date(2014,1,24)
	comment: 'Upgrade to Bootstrap V3.1'
---

if false then div '.pure-g-r.hidden-print', ->
		div '.pure-u-1-2', ->
			div '.first-col', ->

		div '.pure-u-1-2', ->
			div '.second-col', ->
				p '<a href="http://getbootstrap.com/">Boostrap</a> is a set of amazing UI components for HTML pages.'
				p '''
					<a href="http://coffeekup.org/">Coffeekup</a> is a templating language built on top of <a href="http://coffeescript.org/">CoffeeScript</a>. 
					If you already use CoffeeScript instead of Javascript for your web application,	you will love it!
					No HTML tags to open and to close, indentation is used to create nested elements.
				'''
				p '.last-update', 'Updated in 2013 December: Bootstrap upgraded to v3.0.3  - Carousel and modals examples added. '
	




styles=[
	'default'
	'primary'
	'success'
	'info'
	'warning'
	'danger'
]

grid1 = (html) ->
	div '.pure-u-3-5', ->
		div '.first-col', ->
			html()
grid2 = (html) ->
	div '.pure-u-2-5', ->
		div '.second-col', ->
			html()
			
if false then div '.pure-g-r.hidden-print', ->
	grid1 () -> 
		h1 'xxx'
	grid2 () -> 
		h1 'yyy'
		
			
			
		

firstCol = '.pure-u-2-3.first-col'
secondCol = '.pure-u-1-3.second-col.hidden-print'

intro = () ->
	p 'You will find here some snippets to add Bootstrap 3 components to your page written in CoffeeKup language.'

	p '''
	I was tired of going to the official Bootstrap documentation site (even if it is good), copying the HTML code and making the CoffeeKup conversion.
	I have already done the job for you!
	'''

	p 'Select one of the 6 Bootstrap "styles":'
	div '.btn-group', ->
		for style in styles
			button '.btn.btn-' + style ,type: 'button', 'ng-click': 'setStyle(\'' + style + '\')','ng-class': 'setActiveClass(\'' + style + '\')' ,style
	p '.small', -> '''
		The style option will affect the color of several components: buttons, dropdowns, panels...			
	'''

div 'ng-controller': 'StyleCtrl', ->

	div '.pure-g-r', ->
		grid1 () ->
			intro()
		grid2 () =>
			img src: @getPath('img/blog/' + @document.image)	



	h2 ->
		text 'Buttons'
		span '.label.label-{{style}}', '.btn'
	
	div '.pure-g-r', ->
		grid1 () -> 
			pre ->
				code '.lang-coffeescript','''
					button '.btn.btn-{{style}}.btn-lg','Large size'
					button '.btn.btn-{{style}}','Normal size'
					button '.btn.btn-{{style}}.btn-sm','Small size'
					button '.btn.btn-{{style}}.btn-xs','Very small size'
					button '.btn.btn-{{style}}.btn-link','Simple link'
				'''

		grid2 () -> 
			button '.btn.btn-{{style}}.btn-lg','Large size'
			button '.btn.btn-{{style}}','Normal size'
			button '.btn.btn-{{style}}.btn-sm','Small size'
			button '.btn.btn-{{style}}.btn-xs','Very small size'
			button '.btn.btn-{{style}}.btn-link','Simple link'			
	
	h2 ->
		text 'Alerts'
		span '.label.label-{{style}}', '.alert'
	 
	div '.pure-g-r', ->
		grid1 () ->  
			pre ->
				code '.lang-coffeescript', '''
					div '.alert.alert-dismissable.alert-{{style}}', ->
						button '.close', 'type': 'button', 'data-dismiss': "alert", 'aria-hidden':"true",'&times;'
						text 'Your message here. More information here '
						a '.alert-link', 'href':'#', 'here'
				'''
		grid2 () -> 
			div '.alert.alert-dismissable.alert-{{style}}', ->
				button '.close', 'type': 'button',	'data-dismiss': "alert", 'aria-hidden':"true",'&times;'
				text 'Your message here. More information '
				a '.alert-link', 'href':'#', 'here'
		
			
	h2 ->
		text 'Dropdown menu'
		span '.label.label-{{style}}','.dropdown-menu'		

	div '.pure-g-r', ->
		grid1 () -> 
				pre -> 
					code '.lang-coffeescript', '''
						div '.btn-group', -> 
							button '.btn.btn-{{style}}.dropdown-toggle', type: 'button', 'data-toggle': 'dropdown', ->
								text 'Action'
								span '.caret',''
							ul '.dropdown-menu',	->
								li ->
									a href:'#', 'Action 1'
								li ->
									a href:'#', 'Action 2'
								li '.divider', ''
								li ->
									a href:'#', 'Separated link' 
								li '.disabled', ->
									a href:'#', 'Disabled link' 
					'''	

			grid2 () -> 					
				div '.btn-group', -> 
					button '.btn.btn-{{style}}.dropdown-toggle', type: 'button', 'data-toggle': 'dropdown', ->
						text 'Action'
						span '.caret',''
					ul '.dropdown-menu',	->
						li ->
							a href:'#', 'Action 1'
						li ->
							a href:'#', 'Action 2'
						li '.divider', ''
						li ->
							a href:'#', 'Separated link' 
						li '.disabled', ->
							a href:'#', 'Disabled link' 
	
	h2 ->
		text 'Panel'
		span '.label.label-{{style}}', '.panel'
	
	div '.pure-g-r', ->
		grid1 () ->  
			pre ->
				code '.lang-coffeescript', '''
					div '.panel.panel-{{style}}', ->
						div '.panel-heading', 'Panel heading'
						div '.panel-body', 'Panel body'
						div '.panel-footer', 'Panel footer'
				'''
		grid2 () -> 
			div '.panel.panel-{{style}}', ->
				div '.panel-heading', 'Panel heading'
				div '.panel-body', 'Panel body'
				div '.panel-footer', 'Panel footer'
			

	
	h2 ->
		text 'Navigation bar'
		span '.label.label-{{style}}','.navbar'



	myFunction = (x) ->
		h3 'my title: ' + x
	myFunction2 = (x) ->
	 'go!'


	#text console.log.toString()
	
	options = {
		expand: true, label: 'mike'
	}	
	#text nodedump(@document,options)		

	div '.pure-g-r', ->
		grid1 () -> 
			pre ->
				code '.lang-coffeescript', '''
					header '.navbar.navbar-default', ->
						div '.container', ->
							nav role:'navigation', ->
								div '.navbar-header', ->
									button '.navbar-toggle', 'data-toggle':'collapse','data-target':'#my-menu', ->
										span '.icon-bar',''
										span '.icon-bar',''
										span '.icon-bar',''
									a '.navbar-brand', href:'/', 'website'
								div '#my-menu.collapse.navbar-collapse', ->
									ul '.nav.navbar-nav', ->
										li ->
											a href: '#', 'Page 1'
										li '.dropdown', ->
											a '.dropdown-toggle', 'data-toggle': 'dropdown', href: '#', ->
												text 'Page 2'
												span '.caret',''
											ul '.dropdown-menu', ->
												li ->
													a href: '#', 'Page 2.1'		 
												li ->
													a href: '#', 'Page 2.2'					
				'''
		grid2 () -> 

			header '.navbar.navbar-default', ->
				div '.container', ->
					nav role:'navigation', ->
						div '.navbar-header', ->
							button '.navbar-toggle', 'data-toggle':'collapse','data-target':'#my-menu', ->
								span '.icon-bar',''
								span '.icon-bar',''
								span '.icon-bar',''
							a '.navbar-brand', href:'/', 'website'
						div '#my-menu.collapse.navbar-collapse', ->
							ul '.nav.navbar-nav', ->
								li ->
									a href: '#', 'Page 1'
								li '.dropdown', ->
									a '.dropdown-toggle', 'data-toggle': 'dropdown', href: '#', ->
										text 'Page 2'
										span '.caret',''
									ul '.dropdown-menu', ->
										li ->
											a href: '#', 'Page 2.1'		 
										li ->
											a href: '#', 'Page 2.2'		 



	h2 ->
		text 'Navs and tabs'
		span '.label.label-{{style}}', '.nav'
	
	p '.hidden-print', ->
		text 'Select a navigation style: '
		select '.form-control0', 'ng-model': 'navStyle', ->
			option value: '', 'Basic navigation bar'
			option value: 'nav-tabs', 'Tabs'
			option value: 'nav-pills', 'Pills'
			option value: 'nav-pills nav-stacked', 'Stackable pills'

	div '.pure-g-r', ->
		grid1 () -> 
			pre ->
				code '.lang-coffeescript', '''
					ul '.nav{{getCoffeeClassName(navStyle)}}', ->
						li ->
							a 'href': '#tab1', 'data-toggle': 'tab', 'Tab 1'
						li '.active', ->
							a 'href': '#tab2', 'data-toggle': 'tab', 'Tab 2'
						li ->
							a 'href': '#tab3', 'data-toggle': 'tab', 'Tab 3'
						li '.disabled', ->
							a 'href': '#', 'data-toggle': 'tab', 'Tab 4'

					div '.tab-content', ->
						div '#tab1.tab-pane.fade.in.active', ->
							p 'Tab 1 content'
						div '#tab2.tab-pane.fade', ->
							p 'Tab 2 content'
						div '#tab3.tab-pane.fade', ->
							p 'Tab 3 content'
						div '#tab4.tab-pane.fade', ->
							p 'Tab 4 content'
					'''
		grid2 () -> 
			ul '.nav', 'ng-class': 'navStyle', ->
				li ->
					a 'href': '#tab1', 'data-toggle': 'tab', 'Tab 1'
				li '.active', ->
					a 'href': '#tab2', 'data-toggle': 'tab', 'Tab 2'
				li ->
					a 'href': '#tab3', 'data-toggle': 'tab', 'Tab 3'
				li '.disabled', ->
					a 'href': '#', 'data-toggle': 'tab', 'Tab 4'
			 
			div '.tab-content', ->
				div '#tab1.tab-pane.fade.in.active', ->
					p 'Tab 1 content'
				div '#tab2.tab-pane.fade', ->
					p 'Tab 2 content'
				div '#tab3.tab-pane.fade', ->
					p 'Tab 3 content'
				div '#tab4.tab-pane.fade', ->
					p 'Tab 4 content'
		
	h2 ->
		text 'Accordion'
		span '.label.label-{{style}}', '.panel-group'
	
	div '.pure-g-r', ->
		grid1 () ->  
			pre ->
				code '.lang-coffeescript', '''
					div '#acordion.panel-group', ->
						#first panel (expanded by default)
						div '.panel.panel-{{style}}', ->
							div '.panel-heading', ->
								h4 '.panel-title', ->
									a '.accordion-toggle', href: '#collapse1', 'data-toggle': 'collapse', 'data-parent': '#accordion', ->
										text 'Link 1'
							div '#collapse1.panel-collapse.collapse.in', ->
								div '.panel-body', ->
									 text 'Content 1' 
						#second panel (collapsed by default)
						div '.panel.panel-{{style}}', ->
							div '.panel-heading', ->
								h4 '.panel-title', ->
									a '.accordion-toggle.collapsed', href: '#collapse2', 'data-toggle': 'collapse', 'data-parent': '#accordion', ->
										text 'Link 2'
							div '#collapse2.panel-collapse.collapse', ->
								div '.panel-body', ->
									 text 'Content 2'  
				'''
		grid2 () -> 
			div '#acordion.panel-group', ->
				#first panel (expanded by default)
				div '.panel.panel-{{style}}', ->
					div '.panel-heading', ->
						h4 '.panel-title', ->
							a '.accordion-toggle', href: '#collapse1', 'data-toggle': 'collapse', 'data-parent': '#accordion', ->
								text 'Link 1'
					div '#collapse1.panel-collapse.collapse.in', ->
						div '.panel-body', ->
							 text 'Content 1' 
				#second panel (collaosed by default)
				div '.panel.panel-{{style}}', ->
					div '.panel-heading', ->
						h4 '.panel-title', ->
							a '.accordion-toggle.collapsed', href: '#collapse2', 'data-toggle': 'collapse', 'data-parent': '#accordion', ->
								text 'Link 2'
					div '#collapse2.panel-collapse.collapse', ->
						div '.panel-body', ->
							 text 'Content 2' 
							 
	div '.pure-g-r', ->
		grid1 () -> 
			h3 ->
				text 'Extra CSS code to display '
				span '.glyphicon.glyphicon-chevron-right', ''
				text ' and '
				span '.glyphicon.glyphicon-chevron-down', ''
				text ' icons'
			p 'If you want to display 2 different icons for expanded and collapsed panel, you may need to add the following CSS code.'
			pre ->
				code '.css', '''
					.panel-heading .accordion-toggle:after {
						font-family: 'Glyphicons Halflings';/* Bootstrap glyphicons */
						content: "\\e114";/* chevron displayed for expanded items */
						float: right; 
						color: white;
					}
					.panel-heading .accordion-toggle.collapsed:after {
						content: "\\e080";	/* chevron displayed for collapsed items */
					}						
				'''
				
				
	
	
	h2	->
		text 'List group'
		label '.label.label-{{style}}','.list-group'
	div '.pure-g-r', -> 
		grid1 () ->  
			pre ->
				code '.lang-coffeescript', '''
					div '.list-group', ->
						a '.list-group-item', href:'#', 'item 1'
						a '.list-group-item.active', ->
							span '.badge', href:'#', '22'
							text 'item 2'
						a '.list-group-item', href:'#', ->
							span '.badge', '33'
							text 'item 3'
						a '.list-group-item', href:'#', ->
							h4 ".list-group-item-heading", 'List group item heading'
							p '.list-group-item-text', 'item text'
						a '.list-group-item', href:'#', 'item 5'
					''' 

		grid2 () ->  
			div '.list-group', ->
				a '.list-group-item', href:'#', 'item 1'
				a '.list-group-item.active', ->
					span '.badge', href:'#', '22'
					text 'item 2'
				a '.list-group-item', href:'#', ->
					span '.badge', '33'
					text 'item 3'
				a '.list-group-item', href:'#', ->
					h4 ".list-group-item-heading", 'List group item heading'
					p '.list-group-item-text', 'item text'
				a '.list-group-item', href:'#', 'item 5'

	h2 ->
		text 'Responsive forms'
		span '.label.label-{{style}}', '.form-horizontal'
	
	p '.hidden-print', ->
		select 'ng-model': 'inputSize', 'ng-change': 'changeNavStyle()', ->
			option value: 'input-sm', 'Small input'
			option value: '', 'Normal input'
			option value: 'input-lg', 'Large input'
	

	div '.pure-g-r', ->
		grid1 () ->  
			pre ->
				code '.lang-coffeescript', '''
					form '.form-horizontal', ->
						div '.form-group', ->
							label '.col-lg-4.control-label','for': 'inputName', 'Name'
							div '.col-lg-8', ->
								input '#inputName.form-control{{getCoffeeClassName(inputSize)}}', type: 'text', 'placeholder': 'Your name'
						div '.form-group', ->
							label '.col-lg-4.control-label', 'Email'
							div '.col-lg-8', ->
								p '.form-control-static', 'email@example.com (static text)'
						div '.form-group', ->
							label '.col-lg-4.control-label','for': 'select1', 'Select an option'
							div '.col-lg-8', ->
								select '#select1.form-control{{getCoffeeClassName(inputSize)}}', ->
									option value: '1', 'option 1'
									option value: '2', 'option 2'				
						div '.form-group', ->
							div '.col-lg-offset-4.col-lg-8', ->
								div '.radio', ->
									input type: 'radio', name: 'radioOptions', value: 'option1'
									text 'Option 1'
								div '.radio', ->
									input type: 'radio', name: 'radioOptions', value: 'option2'
									text 'Option 2'
					'''

		grid2 () ->  
			form '.form-horizontal', ->
				div '.form-group', ->
					label '.col-lg-4.control-label','for': 'inputName', 'Name'
					div '.col-lg-8', ->
						input '#inputName.form-control', type: 'text', 'placeholder': 'Your name','ng-class': 'inputSize'
				div '.form-group', ->
					label '.col-lg-4.control-label', 'Email'
					div '.col-lg-8', ->
						p '.form-control-static', 'email@example.com (static text)'
				div '.form-group', ->
					label '.col-lg-4.control-label','for': 'select1', 'Select an option'
					div '.col-lg-8', ->
						select '#select1.form-control', 'ng-class': 'inputSize', ->
							option value: '1', 'option 1'
							option value: '2', 'option 2'				
				div '.form-group', ->
					div '.col-lg-offset-4.col-lg-8', ->
						div '.radio', ->
							input type: 'radio', name: 'radioOptions', value: 'option1'
							text 'Option 1'
						div '.radio', ->
							input type: 'radio', name: 'radioOptions', value: 'option2'
							text 'Option 2'		 
	
	h2 'Dialog'
	div '.pure-g-r', ->
		grid1 () ->  
			pre ->
				code '.lang-coffeescript', '''
					div '#my-dialog.modal.fade', 'role': 'dialog', tabindex: '-1', ->
						div '.modal-dialog', ->
							div '.modal-content', ->
								div '.modal-header', ->
									button '.close', type: 'button', 'data-dismiss': 'modal', '&times;'
									h4 '.modal-title','My title'
								div '.modal-body', ->
									p 'My content'
								div '.modal-footer', ->
									button '.btn.btn-default', type: 'button', 'data-dismiss': 'modal', 'Cancel'
									button '.btn.btn-primary', type: 'button', 'OK'				
				'''
		grid2 () -> 
		
			button '.btn.btn-primary', type:'button', 'data-toggle': "modal", 'data-target': "#my-dialog", 'Push to open the dialog box'

			div '#my-dialog.modal.fade', 'role': 'dialog', tabindex: '-1', ->
				div '.modal-dialog', ->
					div '.modal-content', ->
						div '.modal-header', ->
							button '.close', type: 'button', 'data-dismiss': 'modal', '&times;'
							h4 '.modal-title','My title'
						div '.modal-body', ->
							p 'My content'
						div '.modal-footer', ->
							button '.btn.btn-default', type: 'button', 'data-dismiss': 'modal', 'Cancel'
							button '.btn.btn-primary', type: 'button', 'OK'
	
	h2 'Carousel'
	div '.pure-g-r', ->
		grid1 () ->  
			pre ->
				code '.lang-coffeescript', '''
					div '#carousel.carousel.slide', 'data-ride': 'carousel', ->

						#carousel indicators (little circles that show the active slide)
						ol '.carousel-indicators', ->
							li '.active', 'data-slide-to':'0', 'data-target': '#carousel'
							li 'data-slide-to':'1', 'data-target': '#carousel'

						#carousel slides
						div '.carousel-inner', ->
							div '.item.active', ->
								img '.img-responsive','data-src': 'holder.js/400x300/auto'
								div '.carousel-caption', 'Slide #1'
							div '.item', ->
								img '.img-responsive','data-src': 'holder.js/400x300/auto'
								div '.carousel-caption', 'Slide #2'

						#carousel previous and next buttons
						a '.left.carousel-control', 'data-slide': 'prev', href: '#carousel', ->
							span '.glyphicon.glyphicon-chevron-left', ''
						a '.right.carousel-control', 'data-slide': 'next', href: '#carousel', ->
							span '.glyphicon.glyphicon-chevron-right', '				
				'''
		grid2 () ->  
			div '#carousel.carousel.slide', 'data-ride': 'carousel', ->

				#carousel indicators (little circles that show the active slide)
				ol '.carousel-indicators', ->
					li '.active', 'data-slide-to':'0', 'data-target': '#carousel'
					li 'data-slide-to':'1', 'data-target': '#carousel'

				#carousel slides
				div '.carousel-inner', ->
					div '.item.active', ->
						img '.img-responsive','data-src': 'holder.js/400x300/auto'
						div '.carousel-caption', 'Slide #1'
					div '.item', ->
						img '.img-responsive','data-src': 'holder.js/400x300/auto'
						div '.carousel-caption', 'Slide #2'

				#carousel previous and next buttons
				a '.left.carousel-control', 'data-slide': 'prev', href: '#carousel', ->
					span '.glyphicon.glyphicon-chevron-left', ''
				a '.right.carousel-control', 'data-slide': 'next', href: '#carousel', ->
					span '.glyphicon.glyphicon-chevron-right', ''		
		
				
	h2 'Miscellaneous'
	
	div '.pure-g-r', ->
		grid1 () ->  
			pre ->
				code '.lang-coffeescript', '''
					div '.pull-left', 'content on the left' #float: left
					div '.pull-right', 'content on the right' #float: right
					div '.text-center', 'content centered' #text-align: center
					
					span '.glyphicon.glyphicon-globe','' #Glyphicon (a special font used to display icons)
					
					img '.img-responsive', 'src': 'image.png' #picture's width fits its container				
				'''
		grid2 () -> 
			div '.pull-left', 'content on the left' #float: left
			div '.pull-right', 'content on the right' #float: right
			div '.text-center', 'content centered' #float: right		
			
			span '.glyphicon.glyphicon-globe','' #A glyphicn (a spcecial font used to display icons)
			
			img '.img-responsive','data-src': 'holder.js/800x600/auto'
	 
