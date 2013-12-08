animateScroll = () ->
  restrict: 'A',
  link: (scope, $elm, attrs) ->
    $elm.on 'click', () ->
      $("body").animate({scrollTop: $(attrs.href).offset().top}, "swing")

angular.module("app.directives").directive "animateScroll", [ animateScroll ]
