config = require './index'
path = require 'path'
express = require 'express'

module.exports = (app, passport) ->
  app.set 'showStackError', on

  app.use express.errorHandler() if app.get('env') is 'development'

  app.use express.favicon()
  app.use express.json()
  app.use express.urlencoded()
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use express.session({secret: config.session.secretKey})
  app.use passport.initialize()
  app.use passport.session()

  app.use (req, res, next) ->
    res.locals.currentUser = req.user
    next()

  app.use express.static(path.join(__dirname, 'app'))
  app.use app.router

  app.set 'port', config.port
  app.set 'views', path.join(__dirname, '../views')
  app.set 'view engine', 'jade'

