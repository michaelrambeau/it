--- cson
layout: 'post'
title: 'AngularJS memo'
description: 'A set of common AngularJS recipes. Stategies to filter array of data especially.'
date: '2014-11-29'
menuId: 'POSTS'
active: true
comments: false
homepage: true
standalone: false
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
	code '''
		<html ng-app="myapp" ng-controller="MainController">
	'''

p 'About 2 way-binding and scope, it is important to read <a href="https://github.com/angular/angular.js/wiki/Understanding-Scopes">this article from the Github wiki</a>, to avoid some issues when binding JavaScript primitives.'

h3 'Using a controller alias'
p '''
	Instead of binding the template to the controller's scope, the template can be bound to the controller instance.
'''
pre ->
	code '''
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
	code '''
		ng-repeat="element in array | orderBy:'lastUpdateTime' | limitTo:10"
		ng-repeat="(key, value) in map"
	'''
p 'ng-class'
pre ->
	code '''
		<div ng-class="{'selected': item.isSelected}">
	'''
p 'ng-switch'
pre ->
	code '''
		<div ng-switch="expression">
			<div ng-switch-when="matchValue1">...</div>
			<div ng-switch-when="matchValue2">...</div>
			<div ng-switch-default>...</div>
		</div>
	'''
p 'ng-options'
pre ->
	code '''
    <select
      ng-model="team"
      ng-options="team.code as team.name for team in teams">
      <option value="">Select a team</option>
    </select>
	'''

h2 'Filters'

p '''
	We are going to check 3 ways to filter an array of items displayed using ng-repeat.
	Check the code in the following "codepen" for more details about the implementation.
'''

div '.codepen', '''
	<p data-height="300" data-theme-id="0" data-slug-hash="GgpKwp" data-default-tab="result" data-user="mikeair" class='codepen'>See the Pen <a href='http://codepen.io/mikeair/pen/GgpKwp/'>AngularJS Array filters demo</a> by Michael Rambeau (<a href='http://codepen.io/mikeair'>@mikeair</a>) on <a href='http://codepen.io'>CodePen</a>.</p>
	<script async src="//assets.codepen.io/assets/embed/ei.js"></script>
'''

h3 '1. Basic filter'
p '''
	Without implementing any function, it is possible to filter a list of results depending on values entered in a form.
'''
p '''
First, we create a search form that contains 2 fields: a text field to search players by their name, and a combo-box to search by team.
We use a JSON object "search" to store search criteria.
That object has the same attributes "name" and "team" as the items we want to filter.
'''
pre ->
	code '''
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

h3 '2. Filter function defined in the controller'
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
	code '''
    <ul>
      <li ng-repeat="player in players | filter:filterStartWith">{{player.name}}</li>
    </ul>
	'''

h3 '3. Create an Angular custom filter'
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
	code '''
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

h3 'Scope that inherit from the parent'
p '''
	By using <code>scope: true</code>, the directive scope can access values from the parent scope.
	But private variables, limited to the directive scope, can be created.
'''
pre ->
	code '''
		scope: true
	'''

h2 'Service VS Factory'
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


h2 'Form validation'
pre ->
	code '''
		<form name="myForm" ng-submit="myForm.$valid && mySubmitHandler()">
			<input ng-model="player.name" ng-required="true">
		</form>
	'''

h2 'Routing with UI-Router'

p 'Coming soon!'
