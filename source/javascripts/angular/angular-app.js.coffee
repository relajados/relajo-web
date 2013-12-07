app = angular.module "app", ["ngRoute", "ngTouch", "app.controllers"]

app.config ["$routeProvider", ($routeProvider, $locationProvider) ->
    $routeProvider
      .when("/", templateUrl: "templates/relajo.html", controller: "RelajoController")
      .when("/work", templateUrl: "templates/work.html")
      .otherwise redirectTo: "/"
]
