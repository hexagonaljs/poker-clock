#<< sorted_blinds_collection
#<< blind

describe "SortedCollection", =>
  beforeEach =>
    @collection = new SortedBlindsCollection()
    @blind1020 = new Blind(10,20)
    @blind2040 = new Blind(20,40)
    @blind50100 = new Blind(50,100)
    @collection.add(@blind2040)
    @collection.add(@blind1020)
    @collection.add(@blind50100)

  it "should return blinds ordered by a small blind", =>
    expect(@collection.first().equals(@blind1020)).toBe(true)
    expect(@collection.last().equals(@blind50100)).toBe(true)
