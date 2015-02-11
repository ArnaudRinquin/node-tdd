_ = require "lodash"
mongoose = require "mongoose"

schema = new mongoose.Schema
  playerNames: [String]
  games: [{
    points: [
      to: Number
    ]
  }]

gameIsFinished = (game) ->
  score = pointsToScore(game.points)
  scoreDifference = score[0] - score[1]
  return (score[0] >= 11 || score[1] >= 11) && (scoreDifference > 1 || scoreDifference < -1)

gameIsUnfinished = (game) -> ! gameIsFinished(game)

pointsToScore = (points) ->
  points.reduce (score, point) ->
    score[point.to]++
    score
  , [0, 0]

schema.methods.playerScores = (playerIndex) ->
  currentGame = _.first this.games.filter(gameIsUnfinished)

  point = {
    to: playerIndex
  }

  unless currentGame
    currentGame = {
      points:[point]
    }
    this.games.push currentGame
  else
    currentGame.points.push point

schema.methods.getScore = ->
  this.games.map (game)->
    gameScore = pointsToScore(game.points)

module.exports = Match = mongoose.model "Match", schema

Match.prepare = (playerNames) ->
  return new Match
    playerNames: playerNames
    games: [{
      points: []
    }]
