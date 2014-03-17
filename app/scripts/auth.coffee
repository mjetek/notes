angular.module('auth', [
  'ngRoute',
  'ngResource',
  'ngCookies',
  'ngSanitize',
])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/auth/login'
        controller: 'LoginCtrl'
      .when '/register',
        templateUrl: 'views/auth/register'
        controller: 'RegisterCtrl'
      .when '/change-password',
        templateUrl: 'views/auth/change-password'
        controller: 'ChangePasswordCtrl'
      .when '/confirm-success',
        templateUrl: '/vies/auth/confirm-success'
      .when '/reset-password',
        templateUrl: 'views/auth/reset-password'
        controller: 'ResetPasswordCtrl'
      .otherwise
        redirectTo: '/'
