'use strict'

angular.module('notes2App')
  .factory 'Note', ['$resource', ($resource) ->
    $resource '/notes/:slug', slug: '@slug'
  ]
