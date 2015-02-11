dotenv = require 'dotenv'
dotenv.load()

module.exports =
  mongo:
    url: process.env.MONGO_URL || "mongodb://localhost/test"
