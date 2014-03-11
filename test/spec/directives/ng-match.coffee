'use strict'

describe 'Directive: ngMatch', () ->

  # load the directive's module
  beforeEach module 'notes2App'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<ng-match></ng-match>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the ngMatch directive'
