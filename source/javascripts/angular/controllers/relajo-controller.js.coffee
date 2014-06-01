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

  $scope.speech = () ->
    $scope.recognition = new webkitSpeechRecognition()
    $scope.recognition.continuous = false
    $scope.recognition.interimResults = true
    $scope.recognition.onstart = () ->
      console.log("start")
    $scope.recognition.onresult = (event) ->
      console.log("result:" + event)
      final_transcript = ""
      interim_transcript = ""
      i = event.resultIndex
      while i < event.results.length
        if event.results[i].isFinal
          final_transcript += event.results[i][0].transcript
        else
          interim_transcript += event.results[i][0].transcript
        ++i
      alert(final_transcript)
    $scope.recognition.onerror = (event) ->
      console.log("error:" + event)
    $scope.recognition.onend = () ->
      console.log("end")
    $scope.recognition.start()

angular.module("app.controllers").controller "RelajoController", [ '$scope', '$http', 'ngProgressLite', RelajoController ]
