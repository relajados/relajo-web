relajo = angular.module "relajo", ["ngRoute", "ngTouch", "relajo.controllers"]

relajo.config ["$routeProvider", ($routeProvider, $locationProvider) ->
    $routeProvider
      .when("/", templateUrl: "templates/relajo.html", controller: "ButtonsController")
      .when("/work", templateUrl: "templates/work.html")
      .otherwise redirectTo: "/"
]

angular.module("relajo.controllers", [])

ButtonsController = ($scope, $http) ->
  mplayer = new Mplayer("https://mplayerjs.herokuapp.com")

  buttonsUrl = window.BackendURL + '/v1/relajo/buttons.json'

  $http.get(buttonsUrl).success (data) ->
    $scope.buttons = data

  $scope.bClick = (url) ->
    mplayer.play url

  $scope.addButton = () ->
    $http(
      method: 'POST',
      url: buttonsUrl,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      params:
        label: $scope.button.label
        url: $scope.button.url

    ).success((data) ->
      $scope.button.label = ''
      $scope.button.url = ''
      $scope.buttons.push(data)
    )



angular.module("relajo.controllers").controller "ButtonsController", [ '$scope', '$http', ButtonsController ]
