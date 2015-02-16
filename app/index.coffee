express = require 'express'
app = express()

require('./root')(app)

module.exports = app
