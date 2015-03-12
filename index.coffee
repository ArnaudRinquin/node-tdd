noOp = (obj) -> obj

module.exports =
  mapObject: (obj = {}, fn = noOp, context) ->
    Object.keys(obj).map (key) ->
      fn.call(context, obj[key])
