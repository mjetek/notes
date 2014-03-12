User = require '../db/User'
passport = require 'passport'
auth = require('../controllers/auth') passport, User

module.exports = (app, passport) ->
  app.get '/login', auth.login
  app.post '/login', auth.doLogin
  app.get '/logout', auth.logout
  app.post '/auth/register', auth.register

  app.get '/views/auth/login', auth.loginView
  app.get '/views/auth/register', auth.registerView
  app.get '/views/auth/reset-password', auth.resetPasswordView

  app.get '/auth/facebook', auth.facebook
  app.get '/auth/facebook/callback', auth.facebookCb

  app.get '/auth/google', auth.google
  app.get '/auth/google/callback', auth.googleCb
