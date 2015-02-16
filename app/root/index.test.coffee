express = require 'express'
request = require 'supertest'
app = express()

root = require './index.coffee'
root(app)

describe 'GET /', ->
  it 'respond text', (done) ->
    request(app)
      .get('/')
      .set('Accept', 'text/plain')
      .expect(200, done)

  it 'respond hello world!', (done) ->
    request(app)
      .get('/')
      .set('Accept', 'text/plain')
      .expect('hello world!', done)
