class Clock
  constructor: ->

  start: ->
    @interval = setInterval((=> @tick()), @oneSecondInMilliseconds())

  stop: ->
    clearInterval(@interval)

  tick: ->

  oneSecondInMilliseconds: ->
    1000
