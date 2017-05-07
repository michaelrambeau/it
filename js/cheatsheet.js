var app = angular.module('mywebsite', []);
app.controller('StyleCtrl', function ($scope) {
  $scope.getCoffeeClassName = function(classNames){
    //from css class names, separated by a comma, return a string to use in CoffeeKup syntax;
    //ex: "class1 class2" => ".class1.class2"
    if (classNames == "") return "";
    var coffeeClass = '.' + classNames.replace(/ /,'.');
    return coffeeClass;
  };
  
  //Default values
  $scope.style = 'primary';
  $scope.navStyle = 'nav-tabs';
  $scope.inputSize = '';
  
  $scope.setStyle = function (style){
    $scope.style = style;
  };
  
  $scope.setActiveClass = function (style){
    return (style == $scope.style) ? "active" : "";
  };
   	
});