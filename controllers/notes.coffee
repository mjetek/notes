module.exports = (Note) ->
  create: (note, next) ->
    Note.create note, next

  getByPermalink: (permalink, next) ->
    Note.findOne {permalink: permalink}, next

  getList: (sort = 'date', pageSize = 10, page = 1, next) ->
    query = Note.find().sort(sort).skip((page - 1) * pageSize).limit(pageSize)
    query.exec next

  getNotes: (req, res) ->
    sort = req.query.sort ? 'date'
    page = req.query.page ? 1
    pageSize = req.query.pageSize ? 10
    Note.getList sort, page, pageSize, (err, notes) ->
      throw err if err
      res.jsonp(notes)
