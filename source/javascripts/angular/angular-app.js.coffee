app = angular.module "app", ["ngRoute", "ngTouch", "ngProgressLite", "app.controllers", "app.directives"]

app.config ($routeProvider, $locationProvider) ->
  $routeProvider
    .when("/", templateUrl: "templates/relajo.html", controller: "RelajoController", reloadOnSearch: false)
    .when("/work", templateUrl: "templates/work.html")
    .otherwise redirectTo: "/"
  $locationProvider.hashPrefix('!');
