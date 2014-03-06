'use strict'

angular.module('notes2App', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'notes'
        controller: 'MainCtrl'
      .when '/notes/create',
        templateUrl: 'notes/create'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
