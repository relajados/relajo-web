(function() {
  var ButtonsController, relajo;

  relajo = angular.module("relajo", ["relajo.controllers"]);

  angular.module("relajo.controllers", []);

  ButtonsController = function($scope, $http) {
    var index, mplayer;
    mplayer = new Mplayer("https://mplayerjs.herokuapp.com");
    index = "https://dl.dropboxusercontent.com/s/r7w50sbrugaleqx/index.json?dl=1&token_hash=AAEM6DM-pXTohg0df9dzHxgv4l2V_gDnwRkJ_5dv9OtpNQ";
    $http.get(index).success(function(data) {
      return $scope.buttons = data;
    });
    return $scope.bClick = function(url) {
      return mplayer.play(url);
    };
  };

  angular.module("relajo.controllers").controller("ButtonsController", ['$scope', '$http', ButtonsController]);

}).call(this);
