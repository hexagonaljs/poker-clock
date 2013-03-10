#<< round_length

describe "RoundLength", ->

  describe "without arguments", ->
    beforeEach =>
      @roundLength = new RoundLength()

    it "defaults to 0 minutes", =>
      expect(@roundLength.toMinutes()).toEqual(0)

  describe "with arguments", ->
    beforeEach =>
      @roundLength = new RoundLength(5)

    it "returns length in minutes", =>
      expect(@roundLength.toMinutes()).toEqual(5)

    it "returns length in seconds", =>
      expect(@roundLength.toSeconds()).toEqual(300)

    it "updates length in minutes", =>
      @roundLength.update(10)
      expect(@roundLength.toMinutes()).toEqual(10)
      expect(@roundLength.toSeconds()).toEqual(600)

  describe "increase", ->
    beforeEach =>
      @roundLength = new RoundLength(5)

    it "increases length by one", =>
      @roundLength.increase()
      expect(@roundLength.toMinutes()).toEqual(6)

  describe "decrease", ->
    beforeEach =>
      @roundLength = new RoundLength(2)

    it "decreases length by one", =>
      @roundLength.decrease()
      expect(@roundLength.toMinutes()).toEqual(1)

    it "doesn't allow to decrease below one", =>
      @roundLength.decrease()
      @roundLength.decrease()
      expect(@roundLength.toMinutes()).toEqual(1)

