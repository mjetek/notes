Note = require '../db/Note'
notes = require('../controllers/notes') Note

module.exports = (app) ->
  app.get '/notes', notes.getNotes
  app.get '/notes/:permalink', notes.getByPermalink
  app.get '/notes/create', notes.create
  app.post '/notes', notes.doCreate
  # app.put '/notes', notes.update