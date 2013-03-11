#<< collection

class SortedBlindsCollection extends Collection

  add: (args...) ->
    super(args...)
    @items.sort (blind1, blind2) -> blind1.small - blind2.small
