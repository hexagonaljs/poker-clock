class RoundLength
  constructor: (@lengthInMinutes=0) ->
    @minimumLength = 1

  toMinutes: =>
    @lengthInMinutes

  toSeconds: =>
    @lengthInMinutes * 60

  update: (lengthInMinutes) =>
    if lengthInMinutes >= @minimumLength
      @lengthInMinutes = lengthInMinutes

  changeBy: (number) =>
    @update(@lengthInMinutes + number)

  increase: =>
    @changeBy(1)

  decrease: =>
    @changeBy(-1)
