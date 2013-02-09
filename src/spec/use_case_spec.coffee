#<< use_case
#<< clock
#<< blind

describe 'UseCase', ->
  beforeEach =>
    @clock = new Clock()
    @useCase = new UseCase(@clock)

  it "resets clock on start", =>
    spyOn(@clock, 'reset')
    @useCase.start()
    expect(@clock.reset).toHaveBeenCalled()

  it "adds a blind", =>
    blind = new Blind(10, 20)
    @useCase.blindAdded(blind)
    expect(@useCase.blinds).toContain(blind)

  describe 'when time changed', =>

    it 'adds one second to clock', =>
      spyOn(@clock, 'addSecond')
      @useCase.secondElapsed()
      expect(@clock.addSecond).toHaveBeenCalled()

    it 'does not switch to next round until current has finished', =>
      spyOn(@useCase, 'switchToNextRound')
      @useCase.setRoundLength(3)
      2.times @useCase.secondElapsed
      expect(@useCase.switchToNextRound).not.toHaveBeenCalled()

    it 'switches to next round if current round has finished', =>
      spyOn(@useCase, 'switchToNextRound')
      @useCase.setRoundLength(3)
      3.times @useCase.secondElapsed
      expect(@useCase.switchToNextRound).toHaveBeenCalled()

  describe 'switch to next round', =>

    it 'resets clock', =>
      spyOn(@clock, 'reset')
      @useCase.switchToNextRound()
      expect(@clock.reset).toHaveBeenCalled()

    it 'increases blinds', =>
      oldBlind = @useCase.currentBlind()
      @useCase.switchToNextRound()
      newBlind = @useCase.currentBlind()
      expect(newBlind.big).toBeGreaterThan(oldBlind.big)

