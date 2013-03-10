class Glue
  constructor: (@useCase, @gui, @storage, @timer, @clock)->
    LogAll(@useCase)
    LogAll(@gui)

    After(@useCase, 'start', =>
      @timer.start()
      @gui.hideSetup()
      @gui.updateTimer(@clock)
      @gui.updateBlinds(@useCase.currentBlind()))
    After(@useCase, 'secondElapsed', => @gui.updateTimer(@clock))
    After(@useCase, 'switchToNextRound', => @gui.updateBlinds(@useCase.currentBlind()))
    AfterAll(@useCase, [
      'setRoundLength',
      'increaseRoundLength',
      'decreaseRoundLength'],
      => @gui.updateRoundLength(@useCase.roundLength))


    After(@timer, 'tick', => @useCase.secondElapsed())

    After(@gui, 'startClicked', => @useCase.start())
    After(@gui, 'increaseRoundLengthClicked', => @useCase.increaseRoundLength())
    After(@gui, 'decreaseRoundLengthClicked', => @useCase.decreaseRoundLength())
