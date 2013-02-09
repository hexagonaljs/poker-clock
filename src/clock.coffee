class Clock
  constructor: ->
    @secondsElapsed = 0

  addSecond: =>
    @secondsElapsed += 1

  seconds: =>
    @secondsElapsed % 60

  minutes: =>
    Math.floor(@secondsElapsed / 60)

  reset: =>
    @secondsElapsed = 0

  toString: =>
    "#{@minutes().pad(2)}:#{@seconds().pad(2)}"
