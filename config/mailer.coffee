config = require './index'

module.exports = (app, mailer) ->
  mailer.extend app, config.mailer