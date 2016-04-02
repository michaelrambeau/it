--- cson
layout: 'post'
title: 'AngularJS memo'
description: 'A set of common AngularJS recipes. Services, directives, strategies to filter array of data, routing and more.'
date: '2014-11-29'
menuId: 'POSTS'
active: true
comments: false
homepage: false
standalone: true
angular: false
syntaxHighlighter: true
image: '2014-11-angularjs-memo.jpg'
---

p '.intro', '''
  I have been using AngularJS since 2013 and I really loves how this framework makes the creation of dynamic applications easy.
<br />
Here are some "recipes" that I gathered to help me (and other developers, who knows ?) remember how things work in the Angular world.
'''

h2 'Basics'
p '''
  Let's create the application module and one controller.
'''
pre ->
  code '''
    var app = angular.module('myapp', []);
    app.controller('MainController', function($scope) {
      $scope.myPlayer = {
        name: 'Larry Bird'
      };
    });
  '''

p '.small', '''
  Note: <code>angular.module('myapp', [])</code> is a setter, it creates a module called <code>myapp</code> that has no dependencies (the empty array), while <code>angular.module('myapp')</code> is a getter that can be used instead of the global variable called <code>app</code>.
'''

pre ->
  code '.lang-html', '''
    <html ng-app="myapp" ng-controller="MainController">
  '''

p 'About 2 way-binding and scope, it is important to read <a href="https://github.com/angular/angular.js/wiki/Understanding-Scopes">this article from the Github wiki</a>, to avoid some issues when binding JavaScript primitives.'

h3 'Using a controller alias'
p '''
  Instead of binding the template to the controller's scope, the template can be bound to the controller instance.
'''
pre ->
  code '.lang-html', '''
    <div ng-controller="PlayerController as player">
    {{player.name}}
  '''

p 'In this case instead of doing <code>$scope.data = {...}</code> in the controller, we do <code>this.data = {...}</code>'

pre ->
  code '''
    app.controller('PlayerController', function($scope) {
      this.name = 'Larry Bird'
    });
  '''

h3 'Common AngularJS directives'
p 'ng-repeat'
pre ->
  code '.lang-html', '''
    <div ng-repeat="element in array | orderBy:'lastUpdateTime' | limitTo:10">
    <div ng-repeat="(key, value) in map">
  '''
p 'ng-class'
pre ->
  code '.lang-html', '''
    <div ng-class="{'selected': item.isSelected}">
  '''
p 'ng-switch'
pre ->
  code '.lang-html', '''
    <div ng-switch="expression">
      <div ng-switch-when="matchValue1">...</div>
      <div ng-switch-when="matchValue2">...</div>
      <div ng-switch-default>...</div>
    </div>
  '''
p 'ng-options'
pre ->
  code '.lang-html', '''
    <select
      ng-model="team"
      ng-options="team.code as team.name for team in teams">
      <option value="">Select a team</option>
    </select>
  '''

h3 'Render html in a template'

p 'html content is escaped by default. Use $sce service and ng-bind to display html in your templates.'
pre ->
  code '.lang-html','''
    <div ng-bind="html">{{body}}</div>
  '''
pre ->
  code '.lang-javascript','''
    $scope.body = $sce.trustAsHtml(body)
  '''

h2 'Filters'

p '''
  In Angular, the term 'filter' has different meanings depending on the context.<br/>
  A filter can be used to format a string in a template,
  but it can also applied on arrays in order to return a subset of the array.<br/>
  Let's clarify with some examples...
'''

h3 'A. Format string with built-in filters'

p 'Here are examples of built-in filters used to convert string expressions:'

ul ->
  li 'date'
  li 'lowercase'
  li 'uppercase'

p 'In templates, a filter can be applied to any expression followed by a pipe character'

pre ->
  code '''
    {{ myDate}} | date : 'dd/MM/yyyy' }}
  '''

h3 'B. Filtering array of items'

p '''
  We are going to check 3 ways to filter an array of items displayed using ng-repeat.
  Check the code in the following "codepen" for more details about the implementation.
'''

div '.codepen', '''
  <p data-height="300" data-theme-id="0" data-slug-hash="GgpKwp" data-default-tab="result" data-user="mikeair" class='codepen'>See the Pen <a href='http://codepen.io/mikeair/pen/GgpKwp/'>AngularJS Array filters demo</a> by Michael Rambeau (<a href='http://codepen.io/mikeair'>@mikeair</a>) on <a href='http://codepen.io'>CodePen</a>.</p>
  <script async src="//assets.codepen.io/assets/embed/ei.js"></script>
'''

h4 '1. Basic filter'
p '''
  Without implementing any function, it is possible to filter a list of results depending on values entered in a form.
'''
p '''
First, we create a search form that contains 2 fields: a text field to search players by their name, and a combo-box to search by team.
We use a JSON object "search" to store search criteria.
That object has the same attributes "name" and "team" as the items we want to filter.
'''
pre ->
  code '.lang-html', '''
      <input ng-model="search.name" placeholder="Enter name to search">
      <select ng-model="search.team">
        <option value="">All teams</option>
        <option ng-repeat="team in teams" value="{{team.code}}">{{team.name}}</option>
      </select>
  '''
p '''
  Then we filter the array of results using the variable called "search".
  AngularJS will automatically filter the items, matching "name" and "team" properties of every item, against the "search" variable.
'''
pre ->
  code '''
  <ul>
    <li ng-repeat="player in players | filter:search">{{player.name}}</li>
  </ul>
  '''

h4 '2. Filter function defined in the controller'
p '''
  Instead of the search variable, let's use a function defined in the controller. The function will we be runned against each element to filter, returning true if the element has to be included.'''
pre ->
  code '''
    $scope.filterStartWith = function(player) {
      var re = new RegExp('^' + $scope.search.name, "i");
      return player.name.match(re);
    };
  '''
pre ->
  code '.lang-html', '''
    <ul>
      <li ng-repeat="player in players | filter:filterStartWith">{{player.name}}</li>
    </ul>
  '''

h4 '3. Create an Angular custom filter'
p '''
The 2 previous solutions were attached to a given controller.
The 3rd solution is to create an Angular filter that we can call from any template.
<br />
A filter function takes an array of items as the first parameter and returns the array of filtered items.
'''

pre ->
  code '''
    app.filter('teamFilter', function() {
      return function(items, team) {
        if (team == '') return items;
        return items.filter(function (player) {
          return player.team == team;
        });
      };
    });
  '''

p '''
  We can pass as many parameters as needed from the template,
  following the syntax <code >| myCustomFilter | param1 | param2</code>'
'''

pre ->
  code '.lang-html', '''
    <ul>
      <li ng-repeat="player in players | teamFilter:search.team">{{player.name}}</li>
    </ul>
  '''

p '''
  Filters are really powerful when used in templates but they can also be called by JavaScript, using $filter dependency.
'''
pre ->
  code '''
    var filteredPlayers = $filter('teamFilter')($scope.players, $scope.search.team);
  '''


h2 'Custom directives'

p '''
  By default, scope directice inherit from the parent scope.
'''
h3 'Creating an isolated scope'
pre ->
  code '.lang-javascript', '''
    app.directive("myDirective", function() {
      return {
        restrict: "AE",
        templateUrl: "my-template.html",
        scope: {
          title: '@',
          player: '='
        },
        require: '^parentDirective',
        controller: function($scope) {
        },
        controllerAs: "ctrl",
        link: function (scope, element, attrs, parentCtrl) {
          //Here we can call a function defined in the parent directive controller
        }
      };
    });
  '''
p 'Note: directive tag names are in lower case in the html <code>my-directive</code> but in camelcase in the JavaScript code <code>myDirective</code>.'

p '''
  3 options are available when binding data to an isolate scope:
'''
ul ->
  li '<b>@</b> passes data in a string (useful for static properties)'
  li '<b>=</b> passes data in an object (2-way data binding)'
  li '<b>&</b> passes data value in a function (useful to launch a callback from the parent)'


h3 'Scope that inherit from the parent'
p '''
  By using <code>scope: true</code>, the directive scope can access values from the parent scope.
  But private variables, limited to the directive scope, can be created.
'''
pre ->
  code '''
    scope: true
  '''

h3 'Wrapping jQuery plugins in directives'

p '''
  How to wrap Bootstrap popover plugin in a directive that can be used by adding a 'popover' attribute to any html element.
'''

pre ->
  code '''
  .directive('popover', function($timeout) {
    return function(scope, element, attributes) {
      $timeout(function() {
        element.popover({ trigger: 'hover', content: attributes.popover });
      });
      scope.$on('$destroy', function() {
         element.popover('destroy');
      });
    };
  '''

h2 'Service recipes'

p '''
  Services are used to connect data and share it accross the application<br/>
  There are 5 recipes to create a service:
'''

ul ->
  li 'value'
  li 'factory => share function and objects accross the app'
  li 'service => share instances of methods and objects'
  li 'provider => allow configuration'
  li 'constant'

h3 'Service VS Factory'

pre ->
  code '''
    app.service('myService', function() {
      this.sayHello = function(name) {
         return "Hi " + name + "!";
      };
    });
  '''
pre ->
  code '''
    app.factory('myFactory', function() {
      //some code can be run here (private)
      return {
        sayHello : function(name) {
          return "Hi " + name + "!";
        }
      }
    });
  '''

h3 'Example of provider'

p '''
  Let's create a factory used to check the validity of a tweet by calling an external API.<br/>
  We want this factory to allow configuration (the maximum length of the tweet), so we are going to create a provider.<br/>
  All providers have a $get function.<br/>
  Wrap the existing function returned by the factory function in a call to the $get() function.
'''

pre ->
  code '''
    app.provider('Tweetable', [function TweetableProvider() {
      var characterLength = 144;

      this.setLength = function(l) {
        characterLength = l;
      };

      this.$get = function($http) {
       return function(potentialTweet) {
        return $http({
          method: 'POST',
          url: 'http://my-api/tweet',
          data: {
            description: potentialTweet,
            maxLength: characterLength
          }
        });
      };
      };

    }]);
  '''

p 'Configure the service, calling the setLength method'

pre ->
  code '''
    .config(['TweetableProvider', function(TweetableProvider) {
      TweetableProvider.setLength(40);
    }])
  '''


h2 'Working with ngResource module and $resource service'

p 'ngResource module is a nice way to make the application communicate with a REST API.'
p 'Create a factory, injecting $resource service, that defines the REST URL end-point and a custom method.'

pre ->
  code '''
    .factory('Note',['$resource', function NoteFactory($resource) {
      return $resource('/notes', {}, {
        tweetIt: {
          method: 'PUT'
        }
      });
    }]);
  '''

p 'In the controller, call get(), query(), save() and delete() methods'

pre ->
  code '''
    //Get a single resource
    $scope.note = Note.get({id: $routeParams.id})
    //Get all resources
    $scope.notes = Note.query()
    //Save a new resource
    Note.$save(note)
    //Delete
    Note.$delete(note)
  '''

h2 'Form validation'

pre ->
  code '''
    <form name="myForm" ng-submit="myForm.$valid && mySubmitHandler()">
      <input ng-model="player.name" ng-required="true">
    </form>
  '''

h2 'Basic routing with ngRouter module'

h3 'Define the routes'

pre ->
  code '''
    angular.module('NoteApp', ['ngRoute'])
    .config(['$routeProvider', function($routeProvider) {
      $routeProvider
        .when('/', {
          redirectTo: '/notes'
        })
        .when('/notes', {
          templateUrl: 'templates/pages/notes/index.html',
          controller: function($http) {
            var controller = this;
            $http.get('/notes').success(function(data) {
              controller.notes = data;
            });
          },
          controllerAs: 'notesCtrl'
        })
        .when('/users', {
          templateUrl: 'templates/pages/users/index.html'
        })
        .otherwise({
          redirectTo: '/notes'
        });
    }]);
  '''

h3 'Markup'

p 'Use ng-view as a place holder in the view'

pre ->
  code '.lang-html', '''
    <div ng-view></div>
  '''

p 'Example of link'

pre ->
  code '.lang-html', '''
    <a ng-repeat="note in notes" ng-href="#/notes/{{note.id}}">
  '''

p 'Read URL parameters in the controller'

pre ->
  code '''
    angular.module('NoteWrangler')
    .controller('NotesShowController', ['$routeParams', '$http', function($routeParams, $http) {
      var id = $routeParams.id;
      var ctrl = this;
      $http({method: 'GET', url: '/notes/' + id}).success(function(data) {
        ctrl.note = data;
      });
    }]);
  '''

#h2 'Routing with UI-Router'

#p 'Coming soon!'
