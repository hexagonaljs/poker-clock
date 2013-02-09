class BlindCollection
  constructor: (@blinds = []) ->
    @currentIndex = 0

  add: (blind) ->
    @blinds.push(blind)

  next: =>
    @currentIndex += 1

  current: =>
    @blinds[@currentIndex]
