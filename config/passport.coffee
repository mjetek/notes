passport = require 'passport'
LocalStrategy = require('passport-local').Strategy
FacebookStrategy = require('passport-facebook').Strategy
config = require './index'
url = require 'url'
User = require '../db/User'

module.exports = (app) ->
  baseUrl = url.format
    protocol: 'http'
    hostname: config.host
    port: config.port
  console.dir config
  console.log "baseUrl: #{baseUrl}"


  localStrategy = new LocalStrategy () ->
    (username, password, done) ->
      User.findOne {username: username}, (err, user) ->
        return done err if err
        return done null, no, {message: 'Incorrect username.'} if not user
        return done null, no, {message: 'Incorrect password.'} if not user.validPassword password
        return done null, user

  facebookStrategy = new FacebookStrategy {
      clientID: config.facebook.appId
      clientSecret: config.facebook.appSecret
      callbackURL: url.resolve baseUrl, 'auth/facebook/callback'
    }, (accessToken, refreshToken, profile, done) ->
      return done err if err
      if not user then return User.create
        name: profile.displayName
        email: profile.emails[0].value
        username: profile.username
        provider: 'facebook'
        facebook: profile._json, (err, user) ->
          done err, user
      return done null, user
  
  passport.use localStrategy
  passport.use facebookStrategy
