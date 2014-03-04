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

module.exports = mongoose.model 'Note', noteSchema