routes = require '.'

exports.applyRoutes (app) ->
  app.get '/' routes.index