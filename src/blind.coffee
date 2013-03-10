class Blind
  constructor: (@small, @big) ->

  equals: (otherBlind) =>
    @small is otherBlind.small and @big is otherBlind.big

  toString: ->
    "#{@small}/#{@big}"
