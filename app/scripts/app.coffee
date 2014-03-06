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
      .when '/notes',
        templateUrl: 'views/notes'
        controller: 'NotesListCtrl'
      .when '/notes/create',
        templateUrl: 'views/notes/create'
        controller: 'NotesCreateCtrl'
      .otherwise
        redirectTo: '/'
