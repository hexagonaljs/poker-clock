#<< duration

class Round
  constructor: (@length) ->
    @currentDuration = new Duration()

  timeLeft: =>
    @length.diff(@currentDuration)

  isFinished: =>
    @timeLeft().isZero()

  lengthInMinutes: =>
    @length.minutes()

  changeLengthBy: (differenceInMinutes) =>
    if (@lengthInMinutes() + differenceInMinutes) > 0
      @length.changeBy(differenceInMinutes * 60)

  nextSecond: =>
    @currentDuration.addSecond()

  reset: =>
    @currentDuration = new Duration()

  setLength: (lengthInMinutes) =>
    @length = new Duration(lengthInMinutes * 60)

