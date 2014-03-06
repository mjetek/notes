'use strict'

describe 'Service: Notes', () ->

  # load the service's module
  beforeEach module 'notes2App'

  # instantiate service
  Notes = {}
  beforeEach inject (_Notes_) ->
    Notes = _Notes_

  it 'should do something', () ->
    expect(!!Notes).toBe true
