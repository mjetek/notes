exports.requireAuthenticated = (req, res, next) ->
  # return res.redirect 401, '/' if not req.isAuthenticated()
  # return next new Error(401) if not req.isAuthenticated()
  return res.send(401) unless req.isAuthenticated()
  next()

exports.setUser = (req, res, next) ->
  res.locals.user = req.user if req.isAuthenticated()
  next()
