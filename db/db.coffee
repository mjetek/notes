mongoose = require 'mongoose'

mongooseURI = 'mongodb://localhost/notes'
mongoose.connect mongooseURI

mongoose.connection.on 'connected', -> console.log "connected to #{mongooseURI}"
mongoose.connection.on 'disconnected', -> console.log 'Mongoose disconnected'
mongoose.connection.on 'error', (err) -> console.log "Mongoose connection error: #{err}"

process.on 'SIGINT', ->
  mongoose.connection.close ->
    console.log 'Mongoose disconnected through app termination'
    process.exit 0