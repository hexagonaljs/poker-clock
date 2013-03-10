#<< blind
#<< blind_collection
#<< round_length
#<< duration

class UseCase
  constructor: (@round = new Round(new Duration(1))) ->
    @blinds = new BlindCollection [
      new Blind(10, 20)
      new Blind(15, 30)
      new Blind(30, 60)
      new Blind(50, 100)
      new Blind(10, 200)
    ]

  setup: =>
    @setRoundLength(1)

  start: =>
    @round.reset()

  setRoundLength: (lengthInMinutes) =>
    @round.setLength(lengthInMinutes)

  increaseRoundLength: =>
    @round.changeLengthBy(1)

  decreaseRoundLength: =>
    @round.changeLengthBy(-1)

  blindAdded: (blind) =>
    @blinds.add(blind)

  secondElapsed: =>
    @round.nextSecond()
    if @round.isFinished()
      @switchToNextRound()

  switchToNextRound: =>
    @blinds.next()
    @round.reset()

  currentBlind: =>
    @blinds.current()
