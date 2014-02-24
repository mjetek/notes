LocalStrategy = require('passport-local').Strategy
FacebookStrategy = require('passport-facebook').Strategy
config = require './index'
url = require 'url'
User = require '../db/User'

module.exports = (passport) ->
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
      scope: ['basic_info', 'email']
      profileFields: ['id', 'displayName', 'username', 'name', 'emails']
    }, (accessToken, refreshToken, profile, done) ->
      User.findOne {'facebook.id': profile.id}, (err, user) ->
        if not user then return User.create
          displayName: profile.displayName
          email: profile.emails?[0]?.value
          username: profile.username
          provider: 'facebook'
          facebook: profile._json, (err, user) ->
            done err, user
        return done err, user

  passport.serializeUser (user, done) -> done null, user._id
  passport.deserializeUser (id, done) -> User.findOne({_id: id}, 'displayName').lean().exec (err, user) ->
    done err, user

  passport.use localStrategy
  passport.use facebookStrategy

