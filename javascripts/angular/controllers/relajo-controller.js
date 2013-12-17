(function() {
  var RelajoController;

  RelajoController = function($scope, $http, ngProgressLite) {
    var buttonsUrl, mplayer;
    ngProgressLite.start();
    mplayer = new Mplayer("https://mplayerjs.herokuapp.com");
    buttonsUrl = window.BackendURL + '/v1/relajo/buttons.json';
    $http.get(buttonsUrl).success(function(data) {
      $scope.buttons = data;
      return ngProgressLite.done();
    });
    $scope.bPlay = function(url) {
      return mplayer.play(url);
    };
    $scope.sPlay = function(text, lang) {
      var normalizedText;
      normalizedText = text.replace(/\s+/g, '+');
      return mplayer.play("http://translate.google.com/translate_tts?tl=" + lang + "&q=" + normalizedText);
    };
    $scope.mPlay = $scope.bPlay;
    $scope.mStop = function() {
      return mplayer.stop();
    };
    return $scope.addButton = function() {
      ngProgressLite.start();
      return $http({
        method: 'POST',
        url: buttonsUrl,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        params: {
          label: $scope.button.label,
          url: $scope.button.url
        }
      }).success(function(data) {
        $scope.button.label = '';
        $scope.button.url = '';
        $scope.buttons.push(data);
        return ngProgressLite.done();
      });
    };
  };

  angular.module("app.controllers").controller("RelajoController", ['$scope', '$http', 'ngProgressLite', RelajoController]);

}).call(this);
