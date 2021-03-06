_ = require 'lodash'
urls = require '../misc/urls'

module.exports = (passport, User, mailer) ->
  callbackConfig =
    successRedirect: '/app'
    failureRedirect: '/'
    failureFlash: no

  login : (req, res) ->
    res.render 'auth/index'

  loginView : (req, res) ->
    res.render 'auth/login'

  registerView : (req, res) ->
    res.render 'auth/register'

  doLogin : (req, res, next) ->
    (passport.authenticate 'local', (err, user, info) ->
      return next err if err
      if not user
        return res.json
          success: no
          message: 'Incorect user name or password'

      req.logIn user, (err) ->
        return next err if err
        return res.json success: yes) req, res, next

  facebook : passport.authenticate 'facebook'
  facebookCb : passport.authenticate 'facebook', callbackConfig

  google : passport.authenticate 'google'
  googleCb : passport.authenticate 'google', callbackConfig

  logout : (req, res) ->
    req.logout()
    res.redirect '/'

  register : (req, res) ->
    user = req.body
    user.displayName = 
    User.create req.body, (err, user)->
      return res.json err if err

      confirmationUrl = urls.url '/auth/confirm', token: user.activationToken
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
        res.redirect '/#confirm-success'

  confirmSuccessView: (req, res) ->
    res.render 'auth/confirm-success'

  resetPasswordView : (req, res) ->
    res.render 'auth/reset-password'

  resetPassword : (req, res) ->
    criteria = req.body
    User.findOne _.omit(criteria, (value) -> not value), (err, user) ->
      return res.json error: 'There is no user with a given user name or email address' if not user?
      user.setTokenForResetingPassword (user) ->
        user.save (err) ->
          throw err if err
          passwordResetUrl = urls.url 'auth/reset-password-finish', token: user.resetPasswordToken
          mailer.send 'email/reset-password', {
              to: user.email
              subject: 'Password reset'
              url: passwordResetUrl
            }, (err) ->
              console.log "Failed to send an email: #{err}"

  changePasswordView: (req, res) ->
    res.render 'auth/change-password'

  changePassword: (req, res) ->
    data = req.body
    if data.oldPassword
      req.user.changePassword data.oldPassword, data.password, (err) ->
        return res.json err ? success: yes
    User.resetPassword data.token, data.password, (err) ->
      return res.json err ? success: yes

  usernameAvailable : (req, res) ->
    User.usernameAvailable req.params.username, (err, available) ->
      throw err if err

      res.json valid: available