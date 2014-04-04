'use strict'

angular.module('notes2App')
  .controller 'NotesListCtrl', ($scope, $modal, Note) ->
    $scope.notes = Note.query()
    $scope.delete = (note) ->
      modalInstance = $modal.open
        templateUrl: 'deleteModalContent.html'
        controller: 'DeleteNoteController'
        windowClass: 'tiny'

      modalInstance.result.then (action) ->
        note.$remove().then -> 
          $scope.notes.splice $scope.notes.indexOf(note), 1