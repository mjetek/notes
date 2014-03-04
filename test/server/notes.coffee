expect = require('chai').expect
sinon = require 'sinon'

sandbox = null
sinon.config =
  useFakeTimers: no

describe 'Note', ->
  beforeEach ->
    sandbox = sinon.sandbox.create()

  afterEach ->
    sandbox.restore()

  describe '.create()', ->
    it 'should create new note', (done) ->
      testNote =
        title: 'test note'
        content: 'some content'
        author: 1
        tags: ['one', 'two', 'test']
        permalink: 'test-note'
      notes = require '../../db/Note'

      createStub = sandbox.stub(notes, 'create').callsArg 1

      notesCtrl = require('../../controllers/notes') notes

      notesCtrl.create testNote, (err, note) ->
        expect(createStub.withArgs(testNote).calledOnce).to.be.true
        done err

  describe '.getByPermalink()', ->
    it 'should return note by permalink', (done) ->
      permalink = 'test-note'
      notes = require '../../db/Note'
      findOneStub = sandbox.stub(notes, 'findOne').callsArg 1

      notesCtrl = require('../../controllers/notes') notes

      notesCtrl.getByPermalink permalink, (err, note) ->
        expect(findOneStub.withArgs({permalink: permalink}).calledOnce).to.be.true
        done err

  describe '.getList(order, pageSize, page)', ->
    it 'should return page page of size pageSize from all notes ordered by order', (done) ->
      sort = 'date'
      pageSize = 20
      page = 3
      notes = require '../../db/Note'

      Query = require('mongoose').Query

      findStub = sandbox.spy(notes, 'find')
      sortStub = sandbox.spy(Query.prototype, 'sort')
      skipStub = sandbox.spy(Query.prototype, 'skip')
      limitStub = sandbox.spy(Query.prototype, 'limit')
      sandbox.stub(Query.prototype, 'exec').callsArg 0

      notesCtrl = require('../../controllers/notes') notes

      notesCtrl.getList sort, pageSize, page, (err, list)->
        expect(sortStub.withArgs('date').calledOnce).to.be.true
        expect(skipStub.withArgs(40).calledOnce).to.be.true
        expect(limitStub.withArgs(20).calledOnce).to.be.true
        done err




