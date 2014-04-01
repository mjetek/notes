Note = require '../db/Note'
notes = require('../controllers/notes') Note
requireAuthenticated = require('../middlewares/authentication').requireAuthenticated

module.exports = (app) ->
  app.get '/views/notes', requireAuthenticated, notes.viewNotes
  app.get '/notes', requireAuthenticated, notes.getNotes
  app.get '/views/notes/create', requireAuthenticated, notes.create
  app.get '/notes/:permalink', requireAuthenticated, notes.getByPermalink

  app.post '/notes', requireAuthenticated, notes.doCreate