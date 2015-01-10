# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration

getPageLevel = (doc) ->
	url = doc.url
	if url is "/" then return 0
	return url.match(/\//g).length

docpadConfig = {
	watchOptions:
		catchupDelay: 0
	regenerateDelay: 0
	ignoreCustomPatterns: new RegExp('.*\.styl$')
	enabledPlugins:	# example
		coffeekup: true
	plugins: 
		coffeekup:
			coffeecup:
				format: true
	
	templateData:
		nd: require('nodedump')
		projects: require('./projects.coffee').projects
		lib:
			angular: 'https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular.min.js'
		site:
			version: "0.1"
			url: "http://michaelrambeau.com"
			title: "Michael Rambeau"
			email: ""
			description: "Website of Michael Rambeau"
			keywords: ""
			

		getMonth: (d) ->
			months = "JANUARY FEBRUARY MARCH APRIL MAY JUNE JULY AUGUST SEPTEMBER OCTOBER NOVEMBER DECEMBER"
			array = months.split(' ')
			array[d.getMonth()]
			
		getDate: (d) ->
			x = '0' + d.getDate()
			x.substring(x.length - 2)
			
		getPath: (filepath) ->
			level = getPageLevel(@document)
			url=if filepath.charAt(0)=="/" then filepath.substr(1) else filepath
			path = ""
			if level > 0
				for i in [1..level]
					path = path + "../"
			return path + url
			
		
		
		# Link Helper
		getPreparedLink: (name) ->
			link = @site.links[name]
			renderedLink = """
				<a href="#{link.url}" title="#{link.title}" class="#{link.cssClass or ''}">#{link.text}</a>
				"""
			return renderedLink

		# Meta Helpers
		getPreparedTitle: -> if @document.title then "#{@document.title} | #{@site.title}" else @site.title
		getPreparedAuthor: -> @document.author or @site.author
		getPreparedEmail: -> @document.email or @site.email
		getPreparedDescription: -> @document.description or @site.description
		getPreparedKeywords: -> @site.keywords.concat(@document.keywords or []).join(', ')

}

# Export the DocPad Configuration
module.exports = docpadConfig
