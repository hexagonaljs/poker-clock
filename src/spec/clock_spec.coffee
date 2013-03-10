#<< clock

describe "Clock", ->
  describe "new", ->
    beforeEach =>
      @clock = new Clock()

    it "elapsed 0 seconds", =>
      expect(@clock.seconds()).toBe(0)

    it "elapsed 0 minutes", =>
      expect(@clock.minutes()).toBe(0)

  describe "after elapsing 30 seconds", ->
    beforeEach =>
      @clock = new Clock()
      30.times @clock.addSecond

    it "elapsed 30 seconds", =>
      expect(@clock.seconds()).toBe(30)

    it "elapsed 0 minutes", =>
      expect(@clock.minutes()).toBe(0)

  describe "after elapsing 130 seconds", ->
    beforeEach =>
      @clock = new Clock()
      130.times @clock.addSecond

    it "elapsed 130 seconds in total", =>
      expect(@clock.secondsInTotal()).toBe(130)

    it "elapsed 2 minutes and 10 seconds", =>
      expect(@clock.minutes()).toBe(2)
      expect(@clock.seconds()).toBe(10)
