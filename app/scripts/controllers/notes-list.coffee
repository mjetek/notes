'use strict'

angular.module('notes2App')
  .controller 'NotesListCtrl', ($scope, Note) ->
    $scope.notes = Note.query()
    # $scope.notes = [
    #   { title: 'whatever', date: '11-25-2012'}
    #   { title: 'whatever2', date: '08-25-2012'}
    # ]
