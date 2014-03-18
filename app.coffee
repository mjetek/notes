express = require 'express'
db = require './db/db'
http = require 'http'
path = require 'path'
fs = require 'fs'
passport = require 'passport'
mailer = require 'express-mailer'

app = express()

require('./config/passport') passport
require('./config/express') app, passport
require('./config/mailer') app, mailer

console.log __dirname
routesPath = path.join(__dirname, 'routes')
console.log routesPath
require(filepath) app for [filepath, filename] in\
  fs.readdirSync(routesPath).map((filename) -> [path.join(routesPath, filename), filename]) when\
  fs.statSync(filepath).isFile() and /.*\.coffee$/.test filename

http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get 'port'}"