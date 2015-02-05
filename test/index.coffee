chai = require 'chai'
expect = chai.expect
chai.should()

lib = require '../index'

describe 'shout', ->
  
  it 'return passed string as uppercase', ->
    expect(lib.shout('hello')).to.equal 'HELLO'
    
describe 'whisper', ->
  
  it 'return passed string as lowercase', ->
    expect(lib.whisper('heLLO')).to.equal 'hello'