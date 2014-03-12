mongoose = require 'mongoose'
passwordHash = require 'password-hash'

userSchema = mongoose.Schema
  username:
    type: String
    required: no
    index:
      unique: yes
    validate: [
      (val) -> val?.length or provider?,
      '{PATH} cannot be empty'
    ]
  password:
    type: String
    validate: [
      (val) -> val?.length or provider?,
      '{PATH} cannot be empty.'
    ]
  displayName:
    type: String
    required: yes
  email:
    type: String
  active: Boolean
  registrationTime:
    type: Date
    default: Date.now
  provider: String
  facebook: {}
  twitter: {}
  google: {}

userSchema.pre 'validate', (next) ->
  user = this
  return next() if user.provider? or not user.isModified 'username'
  user.displayName = user.username
  next()

userSchema.pre 'save', (next) ->
  user = this
  return next() if (not user.isModified 'password') or not user.password?

  user.password = passwordHash.generate user.password
  return next()

userSchema.methods.verifyPassword = (password, next) ->
  next null, passwordHash.verify password, @password

userSchema.statics.usernameAvailable = (username, next) ->
  this.find({username: username}, {_id: 1}).lean().exec (err, userIds) ->
    return next err if err
    return next null, userIds.length is 0

module.exports = mongoose.model 'User', userSchema