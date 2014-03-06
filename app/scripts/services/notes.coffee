'use strict'

angular.module('notes2App')
  .factory 'Notes', ['$resource', ($resource) ->
    $resource '/notes/:noteId', {noteId: '@id'}
  ]
