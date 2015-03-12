chai = require 'chai'
expect = chai.expect
chai.should()

lib = require '../index'

noOp = (obj) -> obj

describe 'mapObject', ->

  threeAttrObj = {
    florian: 'Hello',
    arnaud: 'World',
    meetup: '!'
  }

  it 'gives an array containing the mapped object\'s attributes based on the provided function', ->

    transformedValues = [
      'HELLO'
      'WORLD'
      '!'
    ]

    toUpperCase = (string)->
      string.toUpperCase()

    expect(lib.mapObject(threeAttrObj, toUpperCase)).to.deep.equal transformedValues

  context 'when given a context', ->

    ctx = {
      prefix: 'foobar'
    }

    append = (string) -> this.prefix + string

    it 'applies the function in this context', ->

      prefixedValues = [
        'foobarHello'
        'foobarWorld'
        'foobar!'
      ]

      expect(lib.mapObject(threeAttrObj, append, ctx)).to.deep.equal prefixedValues

  context 'when not given an object', ->

    it 'should return a empty array', ->

      emptyArray = []
      expect(lib.mapObject(null)).to.deep.equal emptyArray

  context 'when not given a function', ->

    it 'should returns all the attributes values', ->

      objectValues = [
        'Hello'
        'World'
        '!'
      ]

      expect(lib.mapObject(threeAttrObj, null)).to.deep.equal objectValues
