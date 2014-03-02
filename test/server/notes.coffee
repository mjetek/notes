expect = require('chai').expect
# mongoose = require 'mongoose'
sinon = require 'sinon'

describe 'Note', ->
  describe '#create()', ->
    # before ->

    it 'should invoke create method on Note model', (done) ->
      testNote =
        title: 'test note'
        content: 'some content'
        author: 1
        tags: ['one', 'two', 'test']
        permalink: 'test-note'
      notes = require '../../db/Note'

      notesCreateMock = sinon
        .stub(notes, 'create')
        .callsArg 1

      notesCtrl = require('../../controllers/notes') notes

      notesCtrl.create testNote, done