'use strict'

angular.module('notes2App')
  .controller 'NotesCreateCtrl', ($scope, Note) ->
    $scope.note = new Note()
    $scope.save = ->
      $scope.note.$save()
