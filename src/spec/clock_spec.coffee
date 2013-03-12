#<< clock

describe "Clock", =>
  beforeEach =>
    @clock = new Clock()
    jasmine.Clock.useMock()

  it "ticks every 1 second", =>
    spyOn(@clock, 'tick')
    @clock.start()
    jasmine.Clock.tick(1000)
    expect(@clock.tick).toHaveBeenCalled()

  it "can be stopped", =>
    spyOn(@clock, 'tick')
    @clock.start()
    @clock.stop()
    jasmine.Clock.tick(1000)
    expect(@clock.tick).not.toHaveBeenCalled()

  describe "toggle when clock is stopped", =>
    it "starts it", =>
      spyOn(@clock, 'tick')
      @clock.stop()
      @clock.toggle()
      jasmine.Clock.tick(1000)
      expect(@clock.tick).toHaveBeenCalled()

  describe "toggle when clock is running", =>
    it "stops it", =>
      spyOn(@clock, 'tick')
      @clock.start()
      @clock.toggle()
      jasmine.Clock.tick(1000)
      expect(@clock.tick).not.toHaveBeenCalled()

