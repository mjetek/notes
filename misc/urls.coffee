url = require 'url'
_ = require 'lodash'
config = require '../config'

exports.url = (pathname, query, options) ->
  defaultOptions =
    protocol: 'http'
    hostname: config.host
    port: config.port

  urlObj = _.assign defaultOptions, options ? {}
  _.assign urlObj, {pathname, query}

  url.format urlObj