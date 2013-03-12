#<< collection
#<< spec/test_item

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

  describe "remove", =>
    beforeEach =>
      @collection = new Collection()
      @item = new spec.TestItem(1)
      @collection.add(@item)

    it "contains the item initially", =>
      expect(@collection.contains(@item)).toBe(true)

    it "removes the item", =>
      @collection.remove(@item)
      expect(@collection.contains(@item)).toBe(false)

  describe "with 3 items", =>
    beforeEach =>
      @collection = new Collection(["alice", "bob", "claire"])

    it "current returns first item", =>
      expect(@collection.current()).toEqual("alice")

    it "next switches to the next item", =>
      @collection.next()
      expect(@collection.current()).toEqual("bob")

  describe "reset", =>
    beforeEach =>
      @collection = new Collection(["alice", "bob"])
      @collection.next()

    it "points to the second item", =>
      expect(@collection.current()).toBe("bob")

    it "points to the first item after reset", =>
      @collection.reset()
      expect(@collection.current()).toBe("alice")
