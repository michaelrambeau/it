module.exports = (grunt) ->
	grunt.initConfig
		stylus:
			website:
				files: 
					'out/css/website.css': ['src/stylus/website.styl']		
					'out/rakuten/rakuten.css': ['src/documents/rakuten/rakuten.css.styl']		
					'out/lilly/lilly.css': ['src/documents/lilly/lilly.css.styl']		
		
		watch:
			website:
				files: 'src/stylus/**/*.styl'
				tasks: 'style'
				
		concat:
			dist:
				src: ['src/files/vendor/purecss/pure-min.css','out/css/website.css','src/files/vendor/font-awesome/css/font-awesome.min.css'],
				dest: 'out/css/style-concat.min.css'
					
	#first compile the stylus files into css, and then concatenate
	grunt.registerTask 'style', ['stylus','concat']

	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-stylus'
	grunt.loadNpmTasks 'grunt-contrib-concat'