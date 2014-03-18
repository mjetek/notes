exports.requireAuthenticated = (req, res, next) ->
  return res.redirect 401, '/' if not req.isAuthenticated()

exports.setUser = (req, res, next) ->
  res.locals.user = req.user if req.isAuthenticated()
  next()
