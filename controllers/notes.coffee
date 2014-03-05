module.exports = (Note) ->
  create: (req, res) ->
    res.render 'notes/create'

  doCreate: (req, res) ->
    Note.create req.body, next

  getByPermalink: (req, res) ->
    Note.getByPermalink req.params.permalink, (err, note) ->
      throw err if err
      res.jsonp note

  getNotes: (req, res) ->
    sort = req.query.sort ? 'date'
    page = req.query.page ? 1
    pageSize = req.query.pageSize ? 10
    Note.getList sort, page, pageSize, (err, notes) ->
      throw err if err
      res.jsonp(notes)
