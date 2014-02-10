passport = require 'passport'
LocalStrategy - require('passport-local').Strategy
GoogleStrategy = require('passport-google').Strategy
facebookStrategy = require('passport-facebook').Strategy
url = require 'url'
User = require '../db/User'

localStrategy = new LocalStrategy (username, password, done) ->
  User.findOne {username}, (err, user) ->
    return done err if err
    return done null, no, {message: 'Incorrect user name'}

    user.verifyPassword password (err, valid) ->
      return done err if err
      return done null, no, {message: 'Incorrect password'} if not valid
      return done null, user

exports.ensureAuthenticated = (req, res, next) ->
  return req.redirect '/login' if not req.isAuthenticated()
  return next()

exports.setAuthentication = (app) ->
  baseUrl = url.format
    protocol: 'http'
    hostname: app.get 'host'
    port: app.get 'port'
  googleStrategy = new GoogleStrategy {
      returnURL: url.resolve baseUrl, '/auth/google/callback'
      realm: baseUrl
    }, (identifier, profile, done)->
      #todo: implement
  facebookStrategy = new facebookStrategy {
      clientID: app.get 'facebook appId'
      clientSecret: app.get 'facebook secretKey'
      callbackURL: url.resolve baseUrl, '/auth/facebook/callback'
    } , (accessToken, refreshToken, profile, data) -> 