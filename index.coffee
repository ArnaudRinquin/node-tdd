mongo = require "./db/mongo"
mongo.connect()

Match = require "./db/models/match"

match = Match.prepare [
  "Arnaud"
  "Mike"
]

[0..10].forEach ->
  match.playerScores 0

[0..2].forEach ->
  match.playerScores 0

[0..10].forEach ->
  match.playerScores 1

console.log match.getScore()

match.save (err) ->
  console.log err if err
  mongo.disconnect()
