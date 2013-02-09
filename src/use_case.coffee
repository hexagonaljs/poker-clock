#<< blind
#<< blind_collection

class UseCase
  constructor: (@clock) ->
    @blinds = new BlindCollection [
      new Blind(10, 20)
      new Blind(15, 30)
      new Blind(30, 60)
      new Blind(50, 100)
      new Blind(10, 200)
    ]
    @roundLengthInSeconds = 5

  start: =>
    @clock.reset()

  setRoundLength: (@roundLengthInSeconds) =>

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
    @clock.seconds() is @roundLengthInSeconds
