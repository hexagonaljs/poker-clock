class Clock
  constructor: ->

  start: ->
    unless @interval
      @interval = setInterval((=> @tick()), @oneSecondInMilliseconds())

  stop: ->
    if @interval
      clearInterval(@interval)
      @interval = null

  tick: ->

  toggle: ->
    if @interval
      @stop()
    else
      @start()

  oneSecondInMilliseconds: ->
    1000
