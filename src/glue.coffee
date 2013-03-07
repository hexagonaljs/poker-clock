class Glue
  constructor: (@useCase, @gui, @storage, @timer, @clock)->
    LogAll(@useCase)
    LogAll(@gui)

    After(@useCase, 'start', =>
      @gui.updateTimer(@clock)
      @gui.updateBlinds(@useCase.currentBlind()))
    After(@useCase, 'secondElapsed', => @gui.updateTimer(@clock))
    After(@useCase, 'switchToNextRound', => @gui.updateBlinds(@useCase.currentBlind()))

    After(@timer, 'tick', => @useCase.secondElapsed())
