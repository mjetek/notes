'use strict'

describe 'Controller: NotesListCtrl', () ->

  # load the controller's module
  beforeEach module 'notes2App'

  NotesListCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    NotesListCtrl = $controller 'NotesListCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
