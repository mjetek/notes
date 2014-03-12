module.exports = (passport, User) ->
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
    User.create req.body, (err, user)->
      return res.jsonp err if err
      res.jsonp user

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