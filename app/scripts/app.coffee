'use strict'

angular.module('notes2App', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'common'
])
  .config(($routeProvider) ->
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
        .when '/error/:errorname',
          templateUrl: (params) ->
            console.log params
            "views/error/#{params.errorname}"
        .otherwise
          redirectTo: '/notes')
  .config(($httpProvider) ->
    $httpProvider.interceptors.push 'httpErrorHandlerInterceptor')
