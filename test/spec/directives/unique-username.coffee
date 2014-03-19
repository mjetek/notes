'use strict'

describe 'Directive: uniqueUsername', () ->

  # load the directive's module
  beforeEach module 'notes2App'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<unique-username></unique-username>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the uniqueUsername directive'
