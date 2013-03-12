#<< poker_clock
#<< clock
#<< blind

describe 'PokerClock', ->
  beforeEach =>
    @round = new Round(new Duration(1))
    @pokerClock = new PokerClock(@round)
    @blind1 = new Blind(10, 20)
    @blind2 = new Blind(20, 40)
    @pokerClock.addBlind(@blind1)
    @pokerClock.addBlind(@blind2)

  it "resets round on start", =>
    spyOn(@round, 'reset')
    @pokerClock.start()
    expect(@round.reset).toHaveBeenCalled()

  describe 'when time changed', =>

    it 'sets next seconds in the round', =>
      spyOn(@round, 'nextSecond')
      @pokerClock.secondElapsed()
      expect(@round.nextSecond).toHaveBeenCalled()

    it 'does not switch to next round until current has finished', =>
      spyOn(@pokerClock, 'switchToNextRound')
      @pokerClock.setRoundLength(3)
      179.times @pokerClock.secondElapsed
      expect(@pokerClock.switchToNextRound).not.toHaveBeenCalled()

    it 'switches to next round if current round has finished', =>
      spyOn(@pokerClock, 'switchToNextRound')
      @pokerClock.setRoundLength(3)
      185.times @pokerClock.secondElapsed
      expect(@pokerClock.switchToNextRound).toHaveBeenCalled()

  describe 'current blinds', =>
    it 'points to the first blinds initially', =>
      expect(@pokerClock.currentBlind().equals(@blind1)).toBe(true)

  describe 'switch to next round', =>
    it 'resets round', =>
      spyOn(@round, 'reset')
      @pokerClock.switchToNextRound()
      expect(@round.reset).toHaveBeenCalled()

    it 'increases blinds', =>
      @pokerClock.switchToNextRound()
      expect(@pokerClock.currentBlind().equals(@blind2)).toBe(true)

  describe 'change round length', =>
    beforeEach =>
      @pokerClock.setRoundLength(10)

    it 'increases round length by one', =>
      @pokerClock.increaseRoundLength()
      expect(@round.lengthInMinutes()).toEqual(11)

    it 'decreases round length by one', =>
      @pokerClock.decreaseRoundLength()
      expect(@round.lengthInMinutes()).toEqual(9)

  describe 'add blinds', =>
    it 'adds to blind to the enabled blinds array', =>
      blind = new Blind(50, 100)
      @pokerClock.addBlind(blind)
      expect(@pokerClock.enabledBlinds).toContain(blind)

  describe 'remove blinds', =>
    it 'contains the blind initially', =>
      expect(@pokerClock.enabledBlinds.contains(@blind1)).toBe(true)

    it 'removes the blind', =>
      @pokerClock.removeBlind(@blind1)
      expect(@pokerClock.enabledBlinds.contains(@blind1)).toBe(false)

  describe 'restart', =>
    it 'resets the round', =>
      spyOn(@round, 'reset')
      @pokerClock.restart()
      expect(@round.reset).toHaveBeenCalled()

    it 'resets the blinds', =>
      @pokerClock.switchToNextRound()
      @pokerClock.restart()
      expect(@pokerClock.currentBlind().equals(@blind1)).toBe(true)
