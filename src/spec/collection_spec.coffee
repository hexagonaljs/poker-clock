#< collection

describe "Collection", =>
  describe "empty", =>
    beforeEach =>
      @collection = new Collection()

    it "does not contain any items", =>
      expect(@collection.all()).toEqual([])

    it "current returns undefined", =>
      expect(@collection.current()).toBeUndefined()

  describe "add", =>
    beforeEach =>
      @collection = new Collection()
      @item   = 1
      @collection.add(@item)

    it "contains added item", =>
      expect(@collection.all()).toEqual([@item])

    it "current returns added items", =>
      expect(@collection.current()).toEqual(@item)

  describe "with 3 items", =>
    beforeEach =>
      @collection = new Collection(["alice", "bob", "claire"])

    it "current returns first item", =>
      expect(@collection.current()).toEqual("alice")

    it "next switches to the next item", =>
      @collection.next()
      expect(@collection.current()).toEqual("bob")
