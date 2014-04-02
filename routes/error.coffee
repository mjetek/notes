module.exports = (app) ->
  app.get '/views/error/:errorname', (req, res) ->
    res.render 'error',
      title: 'An error occured'
      message: 'Try again later or let us know what happend.'