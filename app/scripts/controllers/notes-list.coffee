'use strict'

angular.module('notes2App')
  .controller 'NotesListCtrl', ($scope) ->
    $scope.notes = [
      { title: 'whatever', date: '11-25-2012'}
      { title: 'whatever2', date: '08-25-2012'}
    ]
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
