class Duration
  constructor: (_totalSeconds = 0) ->
    @_totalSeconds = Math.max(_totalSeconds, 0)

  addSecond: =>
    @_totalSeconds += 1

  totalSeconds: =>
    @_totalSeconds

  seconds: =>
    @_totalSeconds % 60

  minutes: =>
    Math.floor(@_totalSeconds / 60)

  addSecond: =>
    @changeBy(1)

  changeBy: (seconds) =>
    @_totalSeconds += seconds

  isZero: =>
    @_totalSeconds is 0

  diff: (time) =>
    new Duration(@_totalSeconds - time.totalSeconds())

  equals: (otherDuration) =>
    @totalSeconds() is otherDuration.totalSeconds()
