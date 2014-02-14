LocalStrategy - require('passport-local').Strategy
GoogleStrategy = require('passport-google').Strategy
facebookStrategy = require('passport-facebook').Strategy
url = require 'url'
User = require '../db/User'



exports.ensureAuthenticated = (req, res, next) ->
  return req.redirect '/login' if not req.isAuthenticated()
  return next()

exports.setAuthentication = (app) ->
  baseUrl = url.format
    protocol: 'http'
    hostname: app.get 'host'
    port: app.get 'port'

  localStrategy = new LocalStrategy (username, password, done) ->
    User.findOne {username}, (err, user) ->
      return done err if err
      return done null, no, {message: 'Incorrect user name'}

      user.verifyPassword password (err, valid) ->
        return done err if err
        return done null, no, {message: 'Incorrect password'} if not valid
        return done null, user

  googleStrategy = new GoogleStrategy {
      returnURL: url.resolve baseUrl, '/auth/google/callback'
      realm: baseUrl
    }, (identifier, profile, done)->
      #todo: implement

  facebookStrategy = new facebookStrategy {
      clientID: app.get 'facebook appId'
      clientSecret: app.get 'facebook secretKey'
      callbackURL: url.resolve baseUrl, '/auth/facebook/callback'
    } , (accessToken, refreshToken, profile, done) ->
      User.findOne 'facebook.id': profile.id, (err, user) ->
        return done err if err 
        if not user then return User.create
          name: profile.displayName
          email: profile.emails[0].value
          username: profile.username
          provider: 'facebook'
          facebook: profile._json, (err, user) ->
            done err, user
        return done err, user