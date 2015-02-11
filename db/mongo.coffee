mongoose = require 'mongoose'
config = require('../config').mongo

module.exports =
  connect: ->
    mongoose.connect config.url
  disconnect: ->
    mongoose.disconnect()
