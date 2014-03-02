module.exports = (Note) ->

  create: (note, next) ->
    Note.create note, next

  getByPermalink: (permalink, next) ->
    Note.findOne {permalink: permalink}, next