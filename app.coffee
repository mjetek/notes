express = require 'express'
routes = require './routes/routes'
http = require 'http'
path = require 'path'
mongoose = require 'mongoose'
passport = require 'passport'
LocalStrategy = require('passport-local').Strategy
GoogleStrategy = require('passport-google').Strategy
appSettings = require './app-settings'

# connect to mongodb database 
#todo: move it to separate model 
mongooseUrl = 'mongodb://localhost/notes'
mongoose.connect mongooseUrl

app = express()

app.use express.errorHandler() if app.get('env') is 'development'

app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'jade'

appSettings.applySettings app

app.use express.favicon()
app.use express.json()
app.use express.urlencoded()
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.session()

app.use app.router
app.use express.static(path.join(__dirname, 'app'))

routes.applyRoutes app

http.createServer(app).listen app.get 'port', ->
  console.log "Express server listening on port #{app.get 'port'}"