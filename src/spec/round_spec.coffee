#<< round

describe "Round", =>

  describe "3 minutes long", =>
    beforeEach =>
      roundLength = new Duration(3 * 60)
      @round = new Round(roundLength)

    it "has 3 minutes left", =>
      expected = new Duration(180)
      expect(@round.timeLeft().equals(expected)).toBe(true)

    it "is not finished", =>
      expect(@round.isFinished()).toEqual(false)

    it "returns length in minutes", =>
      expect(@round.lengthInMinutes()).toEqual(3)

    it "can be changed", =>
      @round.setLength(5)
      expect(@round.lengthInMinutes()).toEqual(5)

    describe "after 1 second", =>
      beforeEach =>
        roundLength = new Duration(3 * 60)
        @round = new Round(roundLength)
        @round.nextSecond()

      it "has 2 minutes 59 seconds left", =>
        expected = new Duration(2 * 60 + 59)
        expect(@round.timeLeft().equals(expected)).toBe(true)

      it "is not finished", =>
        expect(@round.isFinished()).toEqual(false)

    describe "after 180 seconds", =>
      beforeEach =>
        roundLength = new Duration(3 * 60)
        @round = new Round(roundLength)
        180.times @round.nextSecond

      it "has 0 seconds left", =>
        expected = new Duration(0)
        expect(@round.timeLeft().equals(expected)).toBe(true)

      it "is finished", =>
        expect(@round.isFinished()).toEqual(true)

      it "can be reset", =>
        @round.reset()
        expected = new Duration(3 * 60)
        expect(@round.timeLeft().equals(expected)).toBe(true)

    describe "after 200 seconds", =>
      beforeEach =>
        roundLength = new Duration(3 * 60)
        @round = new Round(roundLength)
        200.times @round.nextSecond

      it "has 0 seconds left", =>
        expect(@round.timeLeft().equals(new Duration(0))).toBe(true)

      it "is finished", =>
        expect(@round.isFinished()).toEqual(true)
