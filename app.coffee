express = require 'express'

db = require './db/db'
passport = require 'passport'
http = require 'http'
path = require 'path'
app = express()

require('./config/express') app
require('./config/passport') app
require('./config/routes') app

http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get 'port'}"