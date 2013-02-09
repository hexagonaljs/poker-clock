class Timer
  constructor: ->
    setInterval((=> @tick()), @oneSecondInMilliseconds())

  tick: ->

  oneSecondInMilliseconds: ->
    1000
