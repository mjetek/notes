index = require '../controllers'

module.exports = (app) ->
  app.get '/app', index.index