(function() {
  var animateScroll;

  animateScroll = function() {
    return {
      restrict: 'A',
      link: function(scope, $elm, attrs) {
        return $elm.on('click', function() {
          return $("body").animate({
            scrollTop: $(attrs.href).offset().top
          }, "swing");
        });
      }
    };
  };

  angular.module("app.directives").directive("animateScroll", [animateScroll]);

}).call(this);
