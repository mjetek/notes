'use strict'

describe 'Controller: ChangePasswordCtrl', () ->

  # load the controller's module
  beforeEach module 'notes2App'

  ChangePasswordCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ChangePasswordCtrl = $controller 'ChangePasswordCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
