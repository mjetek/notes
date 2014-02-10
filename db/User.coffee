mongoose = require 'mongoose'
passwordHash = require 'password-hash'

facebookOAuth2Schema = mongoose.Schema
  id:
    type: String
    required: yes
    index:
      unique: yes

googleOpenIdSchema = mongoose.Schema
  id:
    type: String
    required: yes
    index:
      unique: yes

userSchema = mongoose.Schema
  username:
    type: String
    required: yes
    index:
      unique: yes
  password:
    type: String
  email:
    type: String
  active: Boolean
  registrationTime:
    type: Date
    default: Date.now

userSchema.pre 'save', (next) ->
  user = this
  return next() if (not user.isModified 'password') or not password?

  user.password = passwordHash.generate user.password
  return next()

userSchema.methods.verifyPassword = (password, next) ->
  return next null, passwordHash.verify password, @password

userSchema.statics.usernameAvailable = (username, next) ->
  return this.find({username: username}, {_id: 1}).lean().exec (err, userIds) ->
    return next err if err
    return next null, userIds.length is 0

module.exports = mongoose.model 'User', userSchema