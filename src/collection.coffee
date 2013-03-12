class Collection
  constructor: (@items = []) ->
    @currentIndex = 0

  add: (item) ->
    @items.push(item)

  remove: (item) ->
    @items.remove (current) -> current.equals(item)

  all: ->
    @items

  each: (fn) ->
    @items.each(fn)

  current: ->
    @items[@currentIndex]

  next: ->
    @currentIndex += 1

  first: ->
    @items.first()

  last: ->
    @items.last()

  reset: ->
    @currentIndex = 0

  contains: (searchedItem) ->
    @items.any (item) -> item.equals(searchedItem)

  indexOf: (item) ->
    @items.indexOf(item)
