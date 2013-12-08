RelajoController = ($scope, $http) ->

  mplayer = new Mplayer("https://mplayerjs.herokuapp.com")

  buttonsUrl = window.BackendURL + '/v1/relajo/buttons.json'

  $http.get(buttonsUrl).success (data) ->
    $scope.buttons = data

  $scope.bPlay = (url) ->
    mplayer.play url

  $scope.sPlay = (text, lang) ->
    mplayer.play "http://translate.google.com/translate_tts?tl=#{lang}&q=#{text}"

  $scope.mPlay = $scope.bPlay

  $scope.mStop = -> mplayer.stop()
    

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



angular.module("app.controllers").controller "RelajoController", [ '$scope', '$http', RelajoController ]
