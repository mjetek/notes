index = require './index'

exports.applyRoutes = (app) ->
  app.get '/', index.index