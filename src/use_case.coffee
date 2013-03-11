#<< blind
#<< collection
#<< duration

class UseCase
  constructor: (@round = new Round(new Duration(1))) ->
    @blinds = new Collection [
      new Blind(10, 20)
      new Blind(15, 30)
      new Blind(30, 60)
      new Blind(50, 100)
      new Blind(10, 200)
    ]
    @enabledBlinds = new Collection []

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

  addBlind: (blind) =>
    @enabledBlinds.add(blind)

  removeBlind: (blind) =>
    @enabledBlinds.remove (current) -> current.equals(blind)

  secondElapsed: =>
    @round.nextSecond()
    if @round.isFinished()
      @switchToNextRound()

  switchToNextRound: =>
    @blinds.next()
    @round.reset()

  currentBlind: =>
    @blinds.current()
