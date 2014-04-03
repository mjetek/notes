'use strict'

angular.module('notes2App')
  .controller 'NotesListCtrl', ($scope, $modal, Note) ->
    $scope.notes = Note.query()
    $scope.delete = (note) ->
      $modal.open
        template: 'Are you sure you want to delete this note?'