class Clock
  constructor: ->
    @secondsElapsed = 0

  addSecond: =>
    @secondsElapsed += 1

  secondsInTotal: =>
    @secondsElapsed

  seconds: =>
    @secondsElapsed % 60

  minutes: =>
    Math.floor(@secondsElapsed / 60)

  reset: =>
    @secondsElapsed = 0
