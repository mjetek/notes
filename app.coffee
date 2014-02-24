express = require 'express'
db = require './db/db'
http = require 'http'
passport = require 'passport'

app = express()

require('./config/passport') passport
require('./config/express') app, passport
require('./config/routes') app

http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get 'port'}"