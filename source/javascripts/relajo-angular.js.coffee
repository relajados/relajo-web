relajo = angular.module "relajo", ["relajo.controllers"]

angular.module("relajo.controllers", []);

ButtonsController = ($scope, $http) ->
  mplayer = new Mplayer("https://mplayerjs.herokuapp.com")

  index = "https://dl.dropboxusercontent.com/s/r7w50sbrugaleqx/index.json?dl=1&token_hash=AAEM6DM-pXTohg0df9dzHxgv4l2V_gDnwRkJ_5dv9OtpNQ"

  $http.get(index).success (data) ->
    $scope.buttons = data

  $scope.bClick = (url) ->
    mplayer.play url

angular.module("relajo.controllers").controller "ButtonsController", [ '$scope', '$http', ButtonsController ]
