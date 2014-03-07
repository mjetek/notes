'use strict'

angular.module('notes2App')
  .factory 'Note', ['$resource', ($resource) ->
    $resource '/notes/:noteId', noteId: '@id'
  ]
