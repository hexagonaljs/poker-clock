#<< blind
#<< blind_collection
#<< round_length

class UseCase
  constructor: (@clock) ->
    @blinds = new BlindCollection [
      new Blind(10, 20)
      new Blind(15, 30)
      new Blind(30, 60)
      new Blind(50, 100)
      new Blind(10, 200)
    ]
    @roundLength = new RoundLength()

  setup: =>
    @setRoundLength(1)

  start: =>
    @clock.reset()

  setRoundLength: (roundLengthInMinutes) =>
    @roundLength.update(roundLengthInMinutes)

  increaseRoundLength: =>
    @roundLength.increase()

  decreaseRoundLength: =>
    @roundLength.decrease()

  blindAdded: (blind) =>
    @blinds.add(blind)

  secondElapsed: =>
    @clock.addSecond()
    if @shouldSwitchToNextRound()
      @switchToNextRound()

  switchToNextRound: =>
    @blinds.next()
    @clock.reset()

  currentBlind: =>
    @blinds.current()

  shouldSwitchToNextRound: =>
    @clock.secondsInTotal() is @roundLength.toSeconds()
