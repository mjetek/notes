'use strict'

angular.module('notes2App', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])
  .config ($routeProvider) ->
    $routeProvider
      .when '/notes',
        templateUrl: 'views/notes'
        controller: 'NotesListCtrl'
      .when '/notes/:slug',
        templateUrl: '/views/notes/create'
        controller: 'NotesCreateCtrl'
      .when '/notes/create',
        templateUrl: 'views/notes/create'
        controller: 'NotesCreateCtrl'
      .otherwise
        redirectTo: '/notes'
