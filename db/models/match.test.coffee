chai = require 'chai'
expect = chai.expect
chai.should()
sinon = require 'sinon'

mongoose = require 'mongoose'
mongoose.models = {};
mongoose.modelSchemas = {};

Match = require './match'

describe 'Match', ->

  instance = null
  playerNames = [
    "Arnaud"
    "Mike"
  ]

  beforeEach ->
    instance = Match.prepare playerNames

  describe 'just prepared', ->

    it 'has a single game with a 0-0 score', ->
      expect(instance.getScore()).to.deep.equal([ [0, 0] ])

    it 'keeps the player names', ->
      playerNames.forEach (playerName, index) ->
        expect(instance.playerNames[index]).to.equal(playerName)

  describe 'points', ->

    it 'are cumulated in player scores', ->

      instance.playerScores 0

      expect(instance.getScore()).to.deep.equal([ [1, 0] ])

      instance.playerScores 0

      expect(instance.getScore()).to.deep.equal([ [2, 0] ])

      instance.playerScores 1

      expect(instance.getScore()).to.deep.equal([ [2, 1] ])

    it 'start a new game when the last one is won', ->

      [1..11].forEach ->
        instance.playerScores 0

      expect(instance.getScore()).to.deep.equal([ [11, 0] ])

      instance.playerScores 0

      expect(instance.getScore()).to.deep.equal([ [11, 0], [1, 0] ])
