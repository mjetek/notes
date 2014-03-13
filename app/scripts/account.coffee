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
      .when '/register',
        templateUrl: 'views/auth/register'
        controller: 'RegisterCtrl'
      .when '/confirm-success',
        templateUrl: '/vies/auth/confirm-success'
      .when '/reset-password',
        templateUrl: 'views/auth/reset-password'
        controller: 'ResetPasswordController'
      .otherwise
        redirectTo: '/'
