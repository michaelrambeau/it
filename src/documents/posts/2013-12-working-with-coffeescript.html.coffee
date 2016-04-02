--- 
layout: 'post'
title: 'Working with CoffeeScript and Grunt'
description: 'Why I chose CoffeeScript to generate my JavaScript files and how I set up my environment, using Grunt task management system.'
date: '2013-12-06'
menuId: 'POSTS'
comments: true
active: true
homepage: false
standalone: true
angular: false
isPost: true
syntaxHighlighter: true
image: '2013-12-coffeescript-grunt.jpg'
---

grid1 = (html) ->
  div '.pure-u-1-2', ->
    div '.first-col', ->
      html()
grid2 = (html) ->
  div '.pure-u-1-2', ->
    div '.second-col', ->
      html()

filesystem = (step = 1) ->
  span '.octicon.octicon-file-directory', ''
  span 'myapp'
  ul '.filesystem', ->
    if step >= 3 then li class: (if step is 3 then 'new' else ''), ->
      span '.octicon.octicon-file-text', ''
      span '.filename', 'gruntfile.coffee'

    li ->
      span '.octicon.octicon-file-directory', ''
      span 'src'
      ul '.filesystem', ->
        li ->
          span '.octicon.octicon-file-text', ''
          span 'mycontroller1.coffee'
        li ->
          span '.octicon.octicon-file-text', ''
          span 'app1.coffee'
    li ->
      span '.octicon.octicon-file-directory', ''
      span 'out'
      if step >= 4 then ul '.filesystem ',->
        li ->
          span '.octicon.octicon-file-text', ''
          span 'app.js'
    if step > 0 then li ->
      span '.octicon.octicon-file-directory', ''
      span 'node_modules'
      ul '.filesystem ',->
        li ->
          span '.octicon.octicon-file-directory', ''
          span 'grunt'
        li ->
          span '.octicon.octicon-file-directory', ''
          span 'grunt-contrib-coffee'
        if step >= 5 then li ->
          span '.octicon.octicon-file-directory', ''
          span 'grunt-contrib-watch'



intro = () ->
  p '''
    With <a href="http://nodejs.org/">nodejs</a> expansion, JavaScript is more and more used server-side to build web applications.
    <br/>
    In the other hand JavaScript has some pitfalls:
    it is not object oriented for example (no class), with all the configuration objects and the asynchronous callbacks we use, writing the curly brackets can be tedious...
  '''

  p '''
    <a href="http://coffeescript.org">CoffeeScript</a> is a small language used to generate JavaScript files.
    By using CoffeeScript to generate your JavaScript files, you handle a language whose syntax is far much concise than JavaScript, with "class" support.
  '''
  p '''
    For me, CoffeeScript is beautiful and help me focus on the task I have to do rather than the syntax.<br/>

    This article describes some nice CoffeeScript features and explains how to set up quickly a basic CoffeeScript environment, using Grunt task manager.
  '''
#text @nd.dump @document
div '.pure-g-r', ->
  grid1 () ->
    intro()
  grid2 () =>
    img src: @getPath('img/blog/' + @document.image)

h2 'Quick overview of the language'
h3 'The basics'
div '.pure-g-r', ->
  grid1 () ->
    ul '.custom', ->
      li 'Only indentation is used to create nested blocks of code: no pair of curly bracket {}. It can be a problem when working with IDEs that have different indentation settings (spaces VS tab). '
      li 'No semi-column at the end of the lines.'
      li 'No var keyword to declare variables'

    h3 'About functions'
    ul ->
      li 'No <b>function</b> keyword: an arrow <code>-></code> is used to separate function arguments from function body'
      li '<b>return</b> instruction is implicit (the last instruction inside the function will be returned)'
      li 'When calling a function, parenthesis around arguments are optional.'
      li 'A default value value can be set to function arguments'

  grid2 () ->

    pre ->
      code '.lang-coffeescript','''
        #no "var" keyword
        x = true

        #one-line if statement (with "then" keyword)
        if x is true then console.log 'it is true!'

        #if statement block (no "then" keyword!)
        if x is true
          console.log 'it is true!'

        #An object with 2 properties
        player =
          number: 23
          name: 'MJ'

        #add function. The second argument has a default value
        add = (x, y　= 0) ->
          x + y

        #Binding a click event with jQuery
        $(button).click () -> console.log this
      '''

h2 'Class support'
div '.pure-g-r', ->
  grid1 () ->
    p '''
      Using the <code>class</code> keyword, you can easily create your own classes in a quite elegant way, defining the constructor, the properties and the methods.
      <br/>
    '''
    p '''
      <code>@</code> is a shortcut to "this" keyword.<br/>
      <code>@name</code> and <code>this.name</code> mean the same thing.<br/>
    '''

  grid2 () ->
    pre ->
      code '.lang-coffeescript','''
        #Constructor example 1
        class Player
          constructor: (name, number) ->
            @name = name
            @number = number

        larry = new Player 'Larry', 33
      '''

div '.pure-g-r', ->
  grid1 () ->
    h3 'Constructor optimization'
    p 'The next 2 examples show how you can make the constructor more compact.'
    p '''
      If you use @myProperty as a constructor argument, the class property will be set automatically by the constructor (check the second example).
    '''
    p '''
      In the third example, we use an "option" object to pass parameters to the constructor, instead of passing parameters one by one.
      <br>
      Then we use a feature called "Destructuring assignment" (the name is scary, right ?).
      Look at this:
      <br>
      <code>{@name, @number} = options</code>
    '''
    p '''
      It looks like creating an object with 2 properties, except that the object in on the right of the assignment operator<code>=</code>.
      This code simply means:<br>
      <code>@name = options.name</code><br>
      <code>@number = options.number</code>
    '''
  grid2 () ->
    pre ->
      code '.lang-coffeescript','''
        #Constructor / Example 2
        class Player
          constructor: (@name, @number) ->

        #Constructor / Example 3
        class Player
          constructor: (options) ->
            {@name, @number} = options

        #Example of use
        larry = new Player
          name: 'Larry'
          number: 33
      '''
div '.pure-g-r', ->
  grid1 () ->
    h3 'The "this" issue'
    p '''
      When creating a method, you can use the fat a.pure-g-r <code>=></code> instead of the normal a.pure-g-r <code>-></code> if you want that "this" keyword always means the same thing (the current object).
      <br/>
      It is really useful when inside a class, you have to bind a DOM element with an event for example.
    '''
div '.pure-g-r', ->
  grid1 () ->
    h3 'Inheritance'
    p '''
      You can create a "child" class that inherits from its parent class by using the <code>extends</code> keyword.
    '''
    p '''
      In a child class method or constructor, <code>super()</code> is used to call the same method from the parent class.
    '''
  grid2 () ->
    pre ->
      code '.lang-coffeescript','''
        #Inheritance
        class Player
          constructor: (@name) ->
            @points = 0

          addPoints: (pts) ->
            @points = @points + pts

        class AllStar extends Player
          addPoints: (points) ->
            super points
            console.log 'special behaviour for an All-Star player...'
      '''

h2 'Handling arrays: forEach loops, find, map and max functions'

players = [
  number: 23
  firstname: 'Michael'
,
  number: 33
  firstname: 'Larry'
,
  number: 50
  firstname: 'David'
]

div '.pure-g-r', ->
  grid1 () ->
    p '''
      CoffeeScript provides smart ways to handle array.
      You don't have to include any external library (like jQuery or underscorejs) if you need a map or find function.
      '''
    p 'More details about CoffeeScript idioms <a href="http://arcturo.github.io/library/coffeescript/04_idioms.html">here</a>.'

    h3 'Loops'
    p 'The basic structure to loop through an array is <code class="lang-coffeescript">for element in array</code>'
    p 'If you need to access the index of the element: <code>for element, index in array</code>'
    p '''
      The cool thing is that a method can be called on each element of an array in one line of code.
      <code>doSomething element for element in array</code>
    '''

    p '''
      <code>when</code> keyword can be added at the end of the loop to filter the array.
      It can be useful to find an element from a given key.
    '''
    p 'To loop through an array indexed by key (or to loop through object properties, it is the same thing), use <code>of</code> keyword like this:
    <code>for key, value of object</code>'


    h3 'Splats and max() function'

    p 'CoffeeScript has a feature called "splat" that is used to convert a variable number of arguments into an array and vice-versa.'
    p 'By adding 3 points <code>...</code> after the argument of a function, CoffeeScript converts the array passed into several arguments.'
    p "Let's say we want a function that returns the greatest number of an array of numbers."
    p 'Math.max() method (from Javascript Math native object) can accept any number of arguments but not an array.'
    p 'By using a splat, we can call Math.max with an array: <code>Math.max myArray...</code>'
    p '.small', 'Note: the previous CoffeeScript compiles into the following Javascript code: <code>Math.max.apply(Math, myArray)</code>'

  grid2 () ->

    pre ->
      code '.lang-coffeescript','''
        players = [
          number: 23
          firstname: 'Michael'
        ,
          number: 33
          firstname: 'Larry'
        ,
          number: 50
          firstname: 'David'
        ]

        #map() function equivalent. Returns an array: [23, 33, 50]
        #Do not forget the parenthesis around the expression,
        #otherwise ONLY the last element will be returned.
        numbers = (player.number for player in players)

        #Get the greatest element of the array, using splat "..."
        max = Math.max numbers...


        #Filter the array, finding the player whose number is 33
        #Returns an array with one element: [ { number: 33, firstname: 'Larry' } ]
        filteredArray = (player for player in players when player.number is 33)

        #Without parenthesis, the element found is returned: { number: 33, firstname: 'Larry' }
        myPlayer = player for player in players when player.number is 33

        #Looping trough object properties
        for key, value of myPlayer
          console.log(key,'=',value)


  '''

h2 'How to set up your CoffeeScript environment with Grunt'
div '.pure-g-r', ->
  grid1 () ->
    p '''
      <a href="http://gruntjs.com/">Grunt</a> is a task runner command line tool built on top of nodejs. It can be used to concatenate or minify assets (CSS, JS) for example
      <br>
      We are going to use Grunt to compile our CoffeeScript files into one single JavaScript files, every time they are updated.
      <br>
      The file system of our application is very basic.
      Inside the root folder (called "myapp"), there are 2 sub-folders:
    '''
    ul ->
      li "src contains the .coffee files"
      li 'out contains the compiled JavaScript files, generated by Grunt (you can call it "dist", too)'

    p '''
      Let's see how to install and configure Grunt.
    '''
  grid2 () ->
    p 'The project folder should look like this:'
    filesystem(0)

div '.pure-g-r', ->
  grid1 () ->
    h3 '1. Install Grunt CLI'
    p 'Requirements: nodejs and npm must have been installed on your computer.'
    p 'Install Grunt CLI (Command Line Interface) globally by running this command, from any folder:'
    pre ->
      code '.lang-ini','''
        npm install -g grunt-cli
      '''

h3 '2. Install the Grunt CoffeeScript plugin'
div '.pure-g-r', ->
  grid1 () ->
    p '''
      The CoffeeScript plugins must be installed locally (in your project folder: "myapp" in our example).
      Go to your project folder and run the following command:
    '''

    pre ->
      code '.lang-ini', '''
        npm install grunt-contrib-coffee
      '''
    p '''
      If you don't have any package.json file in your project folder, npm will return an error and only Grunt will be installed locally, not the coffeescript plugin.
      But if you run the same command a second time, it will work!
    '''
    p '''
    An alternative is to create a package.json file in your folder by running the following command.
    The command line will ask you some questions in order to create the file.
    Do not enter any space in the project name. You can skip the questions by pushing enter.

    '''
    pre ->
      code '.lang-ini', '''
        npm init
      '''

    p '''
      Before going to next step, check your file system: a node_modules folder must have been created by npm, with 2 sub-modules (grunt and grunt-contrib-coffee).
    '''
    ul ->
      li 'grunt: about 500 files - 5.5MB'
      li 'grunt-contrib-coffee: about 70 files - 690 KB'

  grid2 () ->
    filesystem(2)

h4 'More about package.json file'
div '.pure-g-r', ->
  grid1 () ->
    p '''
      if you add <code>--save-dev</code> at the end of the plugin install command line, the Grunt CoffeeScript plugin will be saved as a "dev dependency" in the package.json file,
      that is to say a component used during the development workflow to build the project.
    '''
    pre ->
      code '.lang-ini', '''
        npm install grunt-contrib-coffee --save-dev
      '''

    p '''
      What is the advantage of registering dependencies inside the package.json file ?
    '''
    p '''
      Just by running <code>npm install</code> inside your project folder,
      npm will automatically download all components that are part of the application, including the dev dependencies.
    '''

  grid2 () ->
    p 'Example of package.json file with "devDependencies"'
    pre ->
      code '.lang-javascript', '''
{
  "name": "myapp",
  "version": "0.0.0",
  "description": "Demo for my blog entry",
  "author": "Michael",
  "devDependencies": {
    "grunt-contrib-coffee": "~0.7.0"
  }
}
      '''


h3 '3. Configuration'
div '.pure-g-r', ->
  grid1 () ->
    p 'Create a file called <b>gruntfile.coffee</b> in your project folder and copy-paste the following content.'

    pre ->
      code '.lang-coffeescript', '''
        module.exports = (grunt) ->
          grunt.initConfig
            coffee:
              files:
                'out/app.js': ['src/*.coffee']

          grunt.loadNpmTasks 'grunt-contrib-coffee'
      '''

    p 'This file is used to define the "tasks" that we will be able to launch in the next step.'
    p '''
      "coffee" is the name of the task, registered in grint-contrib-plugin that will compile our .coffee file
      <br/>
    '''

  grid2 () ->
    filesystem(3)

h3 '4. Compile the files manually'
div '.pure-g-r', ->
  grid1 () ->
    p '''
      From the command line, launch the "coffee" task.
    '''
    pre ->
      code '.lang-ini', '''
        grunt coffee
      '''
    p 'Check if the JavaScript file was generated as expected in the out folder.'
  grid2 () ->
    filesystem(4)


h3 '5. Compile automatically the files when they are updated'
div '.pure-g-r', ->
  grid1 () ->
    p 'In order to detect any change made your source file, you need to install and configure the grunt-contrib-watch plugin'
    p 'Run the following command in the console:'

    pre ->
      code '.lang-ini', '''
        npm install grunt-contrib-watch
      '''

    p 'The node_modules folder will look like this:'
    ul ->
      li 'grunt: about 500 files - 5.5MB'
      li 'grunt-contrib-coffee: about 70 files - 690 KB'
      li 'grunt-contrib-watch: about 330 files - 2.5 MB'

    p 'Then we have to set up the "watch" in order to launch the "coffee" task every time a .coffee file is created or updated.'
    p 'Update grunt.coffee file as follow:'

    pre ->
      code '.lang-coffeescript', '''
        module.exports = (grunt) ->
          grunt.initConfig
            coffee:
              files:
                'out/app.js': ['src/*.coffee']
            watch:
              files: ['src/*.coffee']
              tasks: 'coffee'

          grunt.loadNpmTasks 'grunt-contrib-coffee'
          grunt.loadNpmTasks 'grunt-contrib-watch'
        '''
  grid2 () ->
    filesystem(5)

h3 'Default private scope'
div '.pure-g-r', ->
  grid1 () ->
    p 'By default, the JavaScript code generated by the compiler is wrapped inside an anonymous function that calls itself <code>(function(){ ... })();</code>'

    p '''
      The purpose of this "safety wrapper" is to avoid polluting the global namespace.
    '''

    p 'It means that classes and functions are private: they cannot be called from an other file.'
    h4 'Solution 1: the bare option'
    p '''
      You can turn off the safety wrapper by setting a configuration option called <code>bare</code> in gruntfile.coffee file.
    '''

    pre ->
      code '.lang-coffeescript', '''
        module.exports = (grunt) ->
          grunt.initConfig
            coffee:
              options:
                bare: true
              files:
                'out/app.js': ['src/*.coffee']
        '''
    h4 'Solution 2: using namespaces'
    p 'A smarter solution would be to create a public namespace, by adding the following HTML code at the top of the page.'
    pre ->
      code '.lang-xml','''
        <script>App = {}</script>
      '''
    p 'Then, in the CoffeeScript code, when you define your class, you can use the App namespace to make the class public.'
    p 'The App namespace has to be used when you create instances of the class, too.'
    pre ->
      code '.lang-coffeescript','''
        class App.Player
          constructor: () ->

        #The following code can be run from any file, if the App namespace is public.
        myPlayer = new App.Player
      '''





h2 'To go further with CoffeeScript'

h3 'The debugging issue'
p '''
The main argument against CoffeeScript is that it makes debugging harder because JavaScript code that runs in the client is not the code you wrote.
'''
p 'Source maps are usually used to enable debugging of JavaScript minified files.'
p '''
The following article explains how to generate "source maps" for your CoffeeScript, to make debugging possible in Chrome console.
It means that you can set breakpoints in your CoffeeScript code!
'''
a href: 'http://ryanflorence.com/2012/coffeescript-source-maps/', 'http://ryanflorence.com/2012/coffeescript-source-maps/'

h3 'Advanced features'
p '''
The following article, from the same blog, describes some advanced features of the language.
A short video demonstrates how some advanced JavaScript code can be made more compact with CoffeeScript
'''
a href: 'http://ryanflorence.com/2012/javascript-coffeescript-rewrite/', 'http://ryanflorence.com/2012/javascript-coffeescript-rewrite/'
