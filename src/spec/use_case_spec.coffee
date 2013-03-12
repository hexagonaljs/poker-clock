#<< use_case
#<< clock
#<< blind

describe 'UseCase', ->
  beforeEach =>
    @round = new Round(new Duration(1))
    @useCase = new UseCase(@round)
    @blind1 = new Blind(10, 20)
    @blind2 = new Blind(20, 40)
    @useCase.addBlind(@blind1)
    @useCase.addBlind(@blind2)

  it "resets round on start", =>
    spyOn(@round, 'reset')
    @useCase.start()
    expect(@round.reset).toHaveBeenCalled()

  describe 'when time changed', =>

    it 'sets next seconds in the round', =>
      spyOn(@round, 'nextSecond')
      @useCase.secondElapsed()
      expect(@round.nextSecond).toHaveBeenCalled()

    it 'does not switch to next round until current has finished', =>
      spyOn(@useCase, 'switchToNextRound')
      @useCase.setRoundLength(3)
      179.times @useCase.secondElapsed
      expect(@useCase.switchToNextRound).not.toHaveBeenCalled()

    it 'switches to next round if current round has finished', =>
      spyOn(@useCase, 'switchToNextRound')
      @useCase.setRoundLength(3)
      185.times @useCase.secondElapsed
      expect(@useCase.switchToNextRound).toHaveBeenCalled()

  describe 'current blinds', =>
    it 'points to the first blinds initially', =>
      expect(@useCase.currentBlind().equals(@blind1)).toBe(true)

  describe 'switch to next round', =>
    it 'resets round', =>
      spyOn(@round, 'reset')
      @useCase.switchToNextRound()
      expect(@round.reset).toHaveBeenCalled()

    it 'increases blinds', =>
      @useCase.switchToNextRound()
      expect(@useCase.currentBlind().equals(@blind2)).toBe(true)

  describe 'change round length', =>
    beforeEach =>
      @useCase.setRoundLength(10)

    it 'increases round length by one', =>
      @useCase.increaseRoundLength()
      expect(@round.lengthInMinutes()).toEqual(11)

    it 'decreases round length by one', =>
      @useCase.decreaseRoundLength()
      expect(@round.lengthInMinutes()).toEqual(9)

  describe 'add blinds', =>
    it 'adds to blind to the enabled blinds array', =>
      blind = new Blind(50, 100)
      @useCase.addBlind(blind)
      expect(@useCase.enabledBlinds).toContain(blind)

  describe 'remove blinds', =>
    it 'contains the blind initially', =>
      expect(@useCase.enabledBlinds.contains(@blind1)).toBe(true)

    it 'removes the blind', =>
      @useCase.removeBlind(@blind1)
      expect(@useCase.enabledBlinds.contains(@blind1)).toBe(false)

  describe 'restart', =>
    it 'resets the round', =>
      spyOn(@round, 'reset')
      @useCase.restart()
      expect(@round.reset).toHaveBeenCalled()

    it 'resets the blinds', =>
      @useCase.switchToNextRound()
      @useCase.restart()
      expect(@useCase.currentBlind().equals(@blind1)).toBe(true)
