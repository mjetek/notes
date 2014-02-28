Note = require '../db/Note'

exports.create = (note, next) ->
  Note.create note, next

exports.getByPermalink = (permalink, next) ->
  Note.findOne {permalink: permalink}, next