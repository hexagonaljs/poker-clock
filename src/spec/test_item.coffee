class spec.TestItem
  constructor: (@value) ->

  equals: (otherItem) =>
    @value == otherItem.value
