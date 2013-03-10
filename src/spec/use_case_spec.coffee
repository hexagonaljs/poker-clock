#<< use_case
#<< clock
#<< blind

describe 'UseCase', ->
  beforeEach =>
    @round = new Round(new Duration(1))
    @useCase = new UseCase(@round)

  it "resets round on start", =>
    spyOn(@round, 'reset')
    @useCase.start()
    expect(@round.reset).toHaveBeenCalled()

  it "adds a blind", =>
    blind = new Blind(10, 20)
    @useCase.addBlind(blind)
    expect(@useCase.enabledBlinds).toContain(blind)

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

  describe 'switch to next round', =>

    it 'resets round', =>
      spyOn(@round, 'reset')
      @useCase.switchToNextRound()
      expect(@round.reset).toHaveBeenCalled()

    it 'increases blinds', =>
      oldBlind = @useCase.currentBlind()
      @useCase.switchToNextRound()
      newBlind = @useCase.currentBlind()
      expect(newBlind.big).toBeGreaterThan(oldBlind.big)

  describe 'change round length', =>
    beforeEach =>
      @useCase.setRoundLength(10)

    it 'increases round length by one', =>
      @useCase.increaseRoundLength()
      expect(@round.lengthInMinutes()).toEqual(11)

    it 'decreases round length by one', =>
      @useCase.decreaseRoundLength()
      expect(@round.lengthInMinutes()).toEqual(9)

