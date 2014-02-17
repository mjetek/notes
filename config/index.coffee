_ = require 'underscore'
path = require 'path'

module.exports = 
  _.extend require(path.join(__dirname, 'env/all')), require(path.join(__dirname, 'env', process.env.NODE_ENV)) or {}