passport = require 'passport'
User = require '../db/User'

module.exports = (app) ->
  auth = require('../controllers/auth') passport, User, app.mailer
  
  app.get '/', auth.login
  app.post '/login', auth.doLogin
  app.get '/logout', auth.logout
  app.post '/auth/register', auth.register

  app.get '/auth/confirm', auth.confirmToken

  app.get '/views/auth/login', auth.loginView
  app.get '/views/auth/register', auth.registerView
  app.get '/views/auth/reset-password', auth.resetPasswordView
  app.get '/views/auth/change-password', auth.changePasswordView
  app.get '/views/auth/confirm-success', auth.confirmSuccessView

  app.post '/auth/reset-password', auth.resetPassword
  app.post '/auth/change-password', auth.changePassword
  # app.get '/auth/reset-password', auth.finishResetPasword

  app.get '/auth/facebook', auth.facebook
  app.get '/auth/facebook/callback', auth.facebookCb

  app.get '/auth/google', auth.google
  app.get '/auth/google/callback', auth.googleCb
