passport = require 'passport'

exports.login = (req, res) ->
  res.render 'accounts/index'

exports.loginView = (req, res) ->
  res.render 'accounts/login'

exports.registerView = (req, res) ->
  res.render 'accounts/register'

exports.resetPasswordView = (req, res) ->
  res.render 'accounts/reset-password'

callbackConfig =
  successRedirect: '/'
  failureRedirect: '/login'
  failureFlash: true

exports.doLogin = passport.authenticate 'local', callbackConfig

exports.facebook = passport.authenticate 'facebook'
exports.facebookCb = passport.authenticate 'facebook', callbackConfig

exports.google = passport.authenticate 'google'
exports.googleCb = passport.authenticate 'google', callbackConfig

exports.logout = (req, res) ->
  req.logout()
  res.redirect '/'