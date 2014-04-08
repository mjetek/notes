'use strict'

angular.module('notes2App')
  .controller 'NotesListCtrl', ($scope, $modal, Note) ->
    $scope.notes = Note.query()
    $scope.delete = (note) ->
      modalInstance = $modal.open
        templateUrl: 'deleteModalContent.html'
        controller: 'DeleteNoteController'
        backdrop: no
        windowClass: 'tiny dn-flip-y'

      modalInstance.result.then (action) ->
        note.$remove().then -> 
          $scope.notes.splice $scope.notes.indexOf(note), 1