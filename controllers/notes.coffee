module.exports = (Note) ->
  create: (req, res) ->
    res.render 'notes/create'

  doCreate: (req, res) ->
    note = req.body
    note.author = req.user
    Note.create req.body, (err, note) ->
      throw err if err
      res.jsonp note

  getByPermalink: (req, res) ->
    Note.getByPermalink req.params.permalink, (err, note) ->
      throw err if err
      res.jsonp note

  viewNotes: (req, res) ->
    res.render ('notes/list')

  getNotes: (req, res) ->
    sort = req.query.sort ? 'time'
    page = req.query.page ? 1
    pageSize = req.query.pageSize ? 10
    Note.getList sort, page, pageSize, (err, notes) ->
      throw err if err
      res.jsonp notes
