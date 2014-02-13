passport = require 'passport'

exports.login = (req, res) ->
  res.render 'login'

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
