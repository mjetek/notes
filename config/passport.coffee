LocalStrategy = require('passport-local').Strategy
FacebookStrategy = require('passport-facebook').Strategy
GoogleStrategy = require('passport-google-oauth').OAuth2Strategy

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

  localStrategy = new LocalStrategy (username, password, done) ->
    User.findOne {username: username}, (err, user) ->
      return done err if err
      return done null, no, {message: 'Incorrect username.'} if not user
      user.verifyPassword password, (err, valid) ->
        return done err if err
        return done null, no, {message: 'Incorrect password.'} if not valid
        return done null, user

  facebookStrategy = new FacebookStrategy {
      clientID: config.facebook.appId
      clientSecret: config.facebook.appSecret
      callbackURL: url.resolve baseUrl, 'auth/facebook/callback'
      scope: ['basic_info', 'email']
      profileFields: ['id', 'displayName', 'name', 'emails']
    }, (accessToken, refreshToken, profile, done) ->
      User.findOne {'facebook.id': profile.id}, (err, user) ->
        return done err if err
        if not user then return User.create
          displayName: profile.displayName
          email: profile.emails?[0]?.value
          provider: 'facebook'
          facebook: profile._json, (err, user) ->
            done err, user
        return done null, user

  googleStrategy = new GoogleStrategy {
      clientID: config.google.appId
      clientSecret: config.google.appSecret
      callbackURL: url.resolve baseUrl, 'auth/google/callback'
      scope: ['profile', 'email']
    }, (accessToken, refreshToken, profile, done) ->
      User.findOne {'google.id': profile.id}, (err, user) ->
        return done err if err
        if not user then User.create
          displayName: profile.displayName
          email: profile.emails?[0]?.value
          provider: 'google'
          google: profile._json, (err, user) ->
            done err, user
        return done null, user


  passport.serializeUser (user, done) -> done null, user._id
  passport.deserializeUser (id, done) -> User.findOne({_id: id}).exec (err, user) ->
    done err, user

  passport.use localStrategy
  passport.use facebookStrategy
  passport.use googleStrategy

