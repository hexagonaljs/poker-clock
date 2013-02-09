#<< clock

describe "Clock", ->
  describe "new", ->
    beforeEach =>
      @clock = new Clock()

    it "elapsed 0 seconds", =>
      expect(@clock.seconds()).toBe(0)

    it "elapsed 0 minutes", =>
      expect(@clock.minutes()).toBe(0)

    it "is 00:00 as a string", =>
      expect(@clock.toString()).toBe('00:00')

  describe "after elapsing 30 seconds", ->
    beforeEach =>
      @clock = new Clock()
      30.times =>
        @clock.addSecond()

    it "elapsed 30 seconds", =>
      expect(@clock.seconds()).toBe(30)

    it "elapsed 0 minutes", =>
      expect(@clock.minutes()).toBe(0)

    it "is 00:30 as a string", =>
      expect(@clock.toString()).toBe('00:30')
