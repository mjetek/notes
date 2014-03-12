config = require './index'

module.exports = (app, mailer) ->
  mailer.extends app, config.mailer