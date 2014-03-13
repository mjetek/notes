config = require '../config'
url = require 'url'

module.exports = (passport, User, mailer) ->
  callbackConfig =
    successRedirect: '/'
    failureRedirect: '/login'
    failureFlash: true

  login : (req, res) ->
    res.render 'accounts/index'

  loginView : (req, res) ->
    res.render 'accounts/login'

  registerView : (req, res) ->
    res.render 'accounts/register'

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
        res.redirect '/auth/confirm-success'

  resetPasswordView : (req, res) ->
    res.render 'accounts/reset-password'

  doLogin : passport.authenticate 'local', callbackConfig

  facebook : passport.authenticate 'facebook'
  facebookCb : passport.authenticate 'facebook', callbackConfig

  google : passport.authenticate 'google'
  googleCb : passport.authenticate 'google', callbackConfig

  logout : (req, res) ->
    req.logout()
    res.redirect '/'