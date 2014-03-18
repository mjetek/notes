mongoose = require 'mongoose'
passwordHash = require 'password-hash'
crypto = require 'crypto'

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
    index: yes
  active:
    type: Boolean
    default: no
  registrationTime:
    type: Date
    default: Date.now
  activationToken:
    type: String
    index:
      sparse: yes
  resetPasswordToken:
    type: String
    index:
      sparse: yes
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
  if user.provider?
    user.active = yes
    return next()

  if user.isModified 'email'
    crypto.randomBytes 24, (ex, buf) ->
      user.activationToken = buf.toString 'hex'
      return next()

  else next()

userSchema.pre 'save', (next) ->
  user = this
  return next() if (not user.isModified 'password') or not user.password?

  user.password = passwordHash.generate user.password
  return next()

userSchema.methods.setTokenForResetingPassword = (next) ->
  user = this
  crypto.randomBytes 24, (ex, buf) ->
    user.resetPasswordToken = buf.toString 'hex'
    next user


userSchema.methods.verifyPassword = (password, next) ->
  next null, passwordHash.verify password, @password

userSchema.statics.usernameAvailable = (username, next) ->
  this.find({username: username}, {_id: 1}).lean().exec (err, userIds) ->
    return next err if err
    return next null, userIds.length is 0

userSchema.methods.changePassword = (oldPassword, newPassword, next) ->
  user = this
  user.verifyPassword oldPassword, (err, valid) ->
    throw err if err
    return next message: 'Invalid password' if not valid

    user.password = newPassword
    user.save next

userSchema.statics.resetPassword = (token, newPassword, next) ->
  this.findOne resetPasswordToken: token, (err, user) ->
    throw err if err
    return next message: 'Invalid token' if not user?

    user.password = newPassword
    user.resetPasswordToken = undefined
    user.save next

module.exports = mongoose.model 'User', userSchema