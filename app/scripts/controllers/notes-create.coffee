'use strict'

angular.module('notes2App')
  .controller 'NotesCreateCtrl', ($scope, $routeParams, Note) ->

    $scope.note = if $routeParams.slug then Note.get(slug: $routeParams.slug) else new Note()
    $scope.save = ->
      $scope.note.$save()
