#< duration

describe "Duration", =>

  describe "new without arguments", =>
    beforeEach =>
      @duration = new Duration()

    it "is set to zero", =>
      expect(@duration.totalSeconds()).toBe(0)

    it "is zero", =>
      expect(@duration.isZero()).toBe(true)

    it "is equal to the duration initialized with 0", =>
      expect(@duration.equals(new Duration(0))).toBe(true)

  describe "new with negative argument", =>
    beforeEach =>
      @duration = new Duration(-10)

    it "changes the value to zero", =>
      expect(@duration.totalSeconds()).toBe(0)

  describe "new with initial value given", =>
    beforeEach =>
      @duration = new Duration(130)

    it "is set to the initial", =>
      expect(@duration.totalSeconds()).toBe(130)

    it "calculates minutes", =>
      expect(@duration.minutes()).toBe(2)

    it "calculates seconds", =>
      expect(@duration.seconds()).toBe(10)

    it "is equal to itself", =>
      expect(@duration.equals(@duration)).toBe(true)

    it "is equal to the same duration", =>
      expect(@duration.equals(new Duration(130))).toBe(true)

    it "is not zero", =>
      expect(@duration.isZero()).toBe(false)

    it "calculates difference between another duration", =>
      difference = @duration.diff(new Duration(20))
      expect(difference.equals(new Duration(110))).toBe(true)

