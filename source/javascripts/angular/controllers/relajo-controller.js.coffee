RelajoController = ($scope, $http, ngProgressLite) ->

  ngProgressLite.start()

  mplayer = new Mplayer("https://mplayerjs.herokuapp.com")

  buttonsUrl = window.BackendURL + '/v1/relajo/buttons.json'

  $http.get(buttonsUrl).success (data) ->
    $scope.buttons = data
    ngProgressLite.done()

  $scope.bPlay = (url) ->
    mplayer.play url

  $scope.sPlay = (text, lang) ->
    normalizedText = text.replace(/\s+/g, '+')
    mplayer.play "http://translate.google.com/translate_tts?tl=#{lang}&q=#{normalizedText}"

  $scope.mPlay = $scope.bPlay

  $scope.mStop = -> mplayer.stop()


  $scope.addButton = () ->
    ngProgressLite.start()
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
      ngProgressLite.done()
    )



angular.module("app.controllers").controller "RelajoController", [ '$scope', '$http', 'ngProgressLite', RelajoController ]
