'use strict'

describe 'Controller: NotesCreateCtrl', () ->

  # load the controller's module
  beforeEach module 'notes2App'

  NotesCreateCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    NotesCreateCtrl = $controller 'NotesCreateCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
