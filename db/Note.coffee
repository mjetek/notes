mongoose = require 'mongoose'
friendly = require 'mongoose-friendly'
paginate = require 'mongoose-paginate'

noteSchema = mongoose.Schema
  title:
    type: String
    required: yes
  content:
    type: String
    required: yes
  author:
    type: mongoose.Schema.Types.ObjectId
    ref: 'User'
    required: yes
  time:
    type: Date
    default: Date.now

noteSchema.plugin friendly
noteSchema.plugin paginate

noteSchema.statics.getList = (sort, page, pageSize, next) ->
  this.paginate {}, page, pageSize, next sortBy: sort
  # this.find()
  #   .sort(sort)
  #   .skip((page-1)*pageSize)
  #   .limit(pageSize)
  #   .exec next

module.exports = mongoose.model 'Note', noteSchema
