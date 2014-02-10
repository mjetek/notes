express = require 'express'
routes = require './routes/routes'
db = require './db/db'
http = require 'http'
path = require 'path'
mongoose = require 'mongoose'
passport = require 'passport'
appSettings = require './app-settings'

app = express()

app.use express.errorHandler() if app.get('env') is 'development'

app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'jade'

appSettings.applySettings(app)

app.use express.favicon()
app.use express.json()
app.use express.urlencoded()
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.cookieParser()
app.use express.session({secret: app.get('session secretKey')})

app.use app.router
app.use express.static(path.join(__dirname, 'app'))

routes.applyRoutes app

http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get 'port'}"