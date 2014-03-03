expect = require('chai').expect
# mongoose = require 'mongoose'
sinon = require 'sinon'

describe 'Note', ->
  describe '#create()', ->
    # before ->

    it 'should create new note', (done) ->
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

      notesCtrl.create testNote, (err, note) ->
        expect(notesCreateMock.calledOnce).to.be.true
        done err
