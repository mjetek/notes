module.exports = (Note) ->

  create: (note, next) ->
    Note.create note, next

  getByPermalink: (permalink, next) ->
    Note.findOne {permalink: permalink}, next

  getList: (sort = 'date', pageSize = 10, page = 1, next) ->
    query = Note.sort(sort).skip((page - 1) * pageSize).limit(pageSize)
    query.exec next