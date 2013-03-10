class Glue
  constructor: (@useCase, @gui, @storage, @clock)->
    LogAll(@useCase)
    LogAll(@gui)

    After(@useCase, 'start', =>
      @clock.start()
      @gui.hideSetup()
      @gui.updateTimeLeft(@useCase.round.timeLeft())
      @gui.updateBlinds(@useCase.currentBlind()))
    After(@useCase, 'secondElapsed', => @gui.updateTimeLeft(@useCase.round.timeLeft()))
    After(@useCase, 'switchToNextRound', => @gui.updateBlinds(@useCase.currentBlind()))
    AfterAll(@useCase, [
      'setRoundLength',
      'increaseRoundLength',
      'decreaseRoundLength'],
      => @gui.updateRoundLength(@useCase.round))


    After(@clock, 'tick', => @useCase.secondElapsed())

    After(@gui, 'startClicked', => @useCase.start())
    After(@gui, 'increaseRoundLengthClicked', => @useCase.increaseRoundLength())
    After(@gui, 'decreaseRoundLengthClicked', => @useCase.decreaseRoundLength())
