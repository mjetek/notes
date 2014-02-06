express = require 'express'
routes = require './routes'
http = require 'http'
mongoose = require 'mongoose'
passport = require 'passport'
LocalStrategy = require('passport-local').Strategy
GoogleStrategy = require('passport-google').Strategy
app = express()

app.set 'port', process.env.PORT or 3000
app.set 'host', process.env.HOST or 'http://localhost'

app.set 'views', path.join(__dirname, 'views')

app.set 'view engine', 'jade'
app.use express.favicon()
app.use express.json()
app.use express.urlencoded()
app.use express.bodyParser()
app.use express.session()

app.use app.router()
app.use express.static, path.join(__dirname, 'app')


http.createServer(app).listen app.get 'port', ->
    console.log "Express server listening on port #{app.get 'port'}"