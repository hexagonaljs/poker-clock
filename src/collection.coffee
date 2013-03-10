class Collection
  constructor: (@items = []) ->
    @currentIndex = 0

  add: (item) ->
    @items.push(item)

  next: =>
    @currentIndex += 1

  all: =>
    @items

  each: (fn) =>
    @items.each(fn)

  current: =>
    @items[@currentIndex]

  first: =>
    @items.first()

  last: =>
    @items.last()

  contains: (searchedItem) =>
    @items.any (item) -> item.equals(searchedItem)

  indexOf: (item) =>
    @items.indexOf(item)
