module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    recess: {
        options:{
               compile:true,
               compress:true
        },           
        main:{
            files: [
                {src: 'src/less/main.less',dest: 'out/css/main.css'}
            ]
        }    
    },
    
    watch: {
        main:{
            files: ['src/less/**/*.less'],
            tasks: ['recess:main']
        }
    }

  });

  // Load the plugin that provides the "uglify" task.
  //grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-recess');
  grunt.loadNpmTasks('grunt-contrib-watch');

  
  //grunt.registerTask('my-recess-task', ['recess:check']);
  
  grunt.registerTask('log', function(arg1) {
    //grunt.log.write('Logging some stuff...'+(new Date()).toString()).ok();
    grunt.log.writeln("Compile! "+arg1);
  });
  
//grunt.event.on('watch', function(action, filepath) {
//  grunt.config(['jshint', 'all'], filepath);
//});

};