expect = require('chai').expect
# sinon = require 'sinon'
# mongoose = require 'mongoose'
notes = require '../controllers/notes'
sinon = require 'sinon'

describe 'Note', ->
  describe '#create()', ->
    before ->

    it 'should add a new note into notes collection', (done) ->
      testNote =
        title: 'test note'
        content: 'some content'
        author: 1
        tags: ['one', 'two', 'test']
        permalink: 'test-note'
      notes.create testNote, (err, note) ->
          done err if err
          notes.getByPermalink note.permalink, (err, note) ->
            done err if err
            expect(note).to.be.eql testNote
            done()