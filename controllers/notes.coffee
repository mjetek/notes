_ = require 'lodash'

module.exports = (Note) ->
  create: (req, res) ->
    res.render 'notes/create'

  doCreate: (req, res) ->
    note = req.body
    note.author = req.user
    Note.create req.body, (err, note) ->
      throw err if err
      res.jsonp note

  doEdit: (req, res) ->
    Note.findByFriendly req.params.permalink, (err, note) ->
      throw err if err
      return res.send 403 unless note.author.equals(req.user._id)
      _.assign note, req.body
      note.save (err, note) ->
        throw err if err
        res.json success: yes

  getByPermalink: (req, res) ->
    Note.findByFriendly req.params.permalink, (err, note) ->
      throw err if err
      return res.send 403 unless note.author.equals(req.user._id)
      res.jsonp note

  viewNotes: (req, res) ->
    res.render ('notes/list')

  getNotes: (req, res) ->
    sort = req.query.sort ? 'time'
    page = req.query.page ? 1
    pageSize = req.query.pageSize ? 10
    Note.getList req.user, sort, page, pageSize, (err, notes) ->
      throw err if err
      res.jsonp notes
