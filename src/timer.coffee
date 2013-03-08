class Timer
  constructor: ->

  start: ->
    setInterval((=> @tick()), @oneSecondInMilliseconds())

  tick: ->

  oneSecondInMilliseconds: ->
    1000
