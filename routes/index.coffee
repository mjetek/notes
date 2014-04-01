index = require '../controllers'
requireAuthenticated = require('../middlewares/authentication').requireAuthenticated

module.exports = (app) ->
  app.get '/app', requireAuthenticated, index.index