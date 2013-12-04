(function() {
  var ButtonsController, relajo;

  relajo = angular.module("relajo", ["relajo.controllers"]);

  angular.module("relajo.controllers", []);

  ButtonsController = function($scope, $http) {
    var buttonsUrl, mplayer;
    mplayer = new Mplayer("https://mplayerjs.herokuapp.com");
    buttonsUrl = window.BackendURL + '/v1/relajo/buttons.json';
    $http.get(buttonsUrl).success(function(data) {
      return $scope.buttons = data;
    });
    $scope.bClick = function(url) {
      return mplayer.play(url);
    };
    return $scope.addButton = function() {
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
        return $scope.buttons.push(data);
      });
    };
  };

  angular.module("relajo.controllers").controller("ButtonsController", ['$scope', '$http', ButtonsController]);

}).call(this);
