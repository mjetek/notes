index = require './index'
auth = require './auth'

exports.applyRoutes = (app) ->
  # Index
  app.get '/', index.index
  # Authentication
  app.get '/login', auth.login
  app.post '/login', auth.doLogin
  app.get '/logout', auth.logout

  app.get '/auth/facebook', auth.facebook
  app.get '/auth/facebook/callback', auth.facebookCb

  app.get '/auth/google', auth.google
  app.get '/auth/google/callback', auth.googleCb