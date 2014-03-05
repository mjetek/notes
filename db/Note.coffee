mongoose = require 'mongoose'

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
  permalink:
    type: String
    required: yes
    index:
      unique: yes
  time:
    type: Date
    default: Date.now

noteSchema.statics.getList = (sort, page, pageSize, next) ->
  this.find()
    .sort(sort)
    .skip((page-1)*pageSize)
    .limit(pageSize)
    .exec next


module.exports = mongoose.model 'Note', noteSchema
