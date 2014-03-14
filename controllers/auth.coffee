config = require '../config'
url = require 'url'
crypto = require 'crypto'

module.exports = (passport, User, mailer) ->
  callbackConfig =
    successRedirect: '/'
    failureRedirect: '/login'
    failureFlash: true

  login : (req, res) ->
    res.render 'auth/index'

  loginView : (req, res) ->
    res.render 'auth/login'

  registerView : (req, res) ->
    res.render 'auth/register'

  register : (req, res) ->
    user = req.body
    user.displayName = 
    User.create req.body, (err, user)->
      return res.json err if err

      confirmationUrl = url.format
        protocol: 'http'
        hostname: config.host
        port: config.port
        pathname: '/auth/confirm'
        query:
          token: user.activationToken
      mailer.send 'email/registration-confirm', {
          to: user.email
          subject: 'Confirm your email address'
          url: confirmationUrl
        }, (err) -> 
          # throw err if err
          console.log "Failed to send an email: #{err}"
      res.json success: yes

  confirmToken: (req, res) ->
    token = req.query.token
    User.findOne activationToken: token, (err, user) ->
      throw err if err
      return res.redirect '/auth/error/invalid-token' unless user?
      
      user.active = yes
      user.activationToken = undefined
      user.save ->
        res.redirect '/login/#confirm-success'

  confirmSuccessView: (req, res) ->
    res.render 'auth/confirm-success'

  resetPasswordView : (req, res) ->
    res.render 'auth/reset-password'

  resetPassword : (req, res) ->
    criteria = req.body
    User.findOne criteria, (err, user) ->
      return json error: 'There is no user with a given user name or email address'
      user.setTokenForResetingPassword (user) ->
        # todo create module which will generate urls
        passwordResetUrl = url.format
          protocol: 'http'
        mailer.send 'email/reset-password', {
            to: user.email
            subject: 'Password reset'
            url
          }

  doLogin : passport.authenticate 'local', callbackConfig

  facebook : passport.authenticate 'facebook'
  facebookCb : passport.authenticate 'facebook', callbackConfig

  google : passport.authenticate 'google'
  googleCb : passport.authenticate 'google', callbackConfig

  logout : (req, res) ->
    req.logout()
    res.redirect '/'