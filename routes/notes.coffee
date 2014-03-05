Note = require '../db/Note'
notes = require('../controllers/notes') Note

module.exports = (app) ->
  app.get '/notes', notes.getNotes
  # app.get '/notes/:permalink' notes.getByPermalink
  # app.post '/notes', notes.create
  # app.put '/notes', notes.update