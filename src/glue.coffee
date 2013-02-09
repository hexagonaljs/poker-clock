class Glue
  constructor: (@useCase, @gui, @storage, @timer, @clock)->
    LogAll(@useCase)
    LogAll(@gui)

    After(@useCase, 'start', =>
      @gui.createTimer()
      @gui.createBlinds(@useCase.currentBlind()))
    After(@useCase, 'secondElapsed', => @gui.updateTimer(@clock))
    After(@useCase, 'switchToNextRound', => @gui.updateBlind(@useCase.currentBlind()))

    After(@timer, 'tick', => @useCase.secondElapsed())
