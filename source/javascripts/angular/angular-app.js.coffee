app = angular.module "app", ["ngRoute", "ngTouch", "app.controllers", "app.directives"]

app.config ($routeProvider, $locationProvider) ->
  $routeProvider
    .when("/", templateUrl: "templates/relajo.html", controller: "RelajoController", reloadOnSearch: false)
    .when("/work", templateUrl: "templates/work.html")
    .otherwise redirectTo: "/"


app.run ($location, $rootScope) ->
  $rootScope.$on '$viewContentLoaded', ->
    $rootScope.$watch(
      ()->
        $location.search()
      (search) ->
        scrollPos = 0
        if search.hasOwnProperty('scroll')
          $target = $('#' + search.scroll)
          scrollPos = $target.offset().top
        $("body,html").animate({scrollTop: scrollPos}, "slow")
    )
