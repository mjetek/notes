angular.module('account', [
  'ngRoute',
  'ngCookies',
  'ngSanitize'
])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/auth/login'
        controller: 'LoginCtrl'
      .otherwise
        redirectTo: '/'
