#<< sorted_blinds_collection

class PokerClock
  constructor: (@round, availableBlinds, enabledBlinds) ->
    @availableBlinds = new SortedBlindsCollection(availableBlinds)
    @enabledBlinds = new SortedBlindsCollection(enabledBlinds)

  setup: =>

  start: =>
    @round.reset()

  setRoundLength: (lengthInMinutes) =>
    @round.setLength(lengthInMinutes)

  increaseRoundLength: =>
    @round.changeLengthBy(1)

  decreaseRoundLength: =>
    @round.changeLengthBy(-1)

  addBlind: (blind) =>
    @enabledBlinds.add(blind)

  removeBlind: (blind) =>
    @enabledBlinds.remove(blind)

  secondElapsed: =>
    @round.nextSecond()
    if @round.isFinished()
      @switchToNextRound()

  switchToNextRound: =>
    @enabledBlinds.next()
    @round.reset()

  restart: =>
    @round.reset()
    @enabledBlinds.reset()

  pause: =>

  currentBlind: =>
    @enabledBlinds.current()
