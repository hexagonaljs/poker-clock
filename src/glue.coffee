class Glue
  constructor: (@useCase, @gui, @storage, @clock)->
    LogAll(@useCase)
    LogAll(@gui)

    After(@useCase, 'setup', => @gui.updateSelectedBlinds(@useCase.blinds, @useCase.enabledBlinds))

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
    AfterAll(@useCase, [
      'addBlind',
      'removeBlind'],
      => @gui.updateSelectedBlinds(@useCase.blinds, @useCase.enabledBlinds))


    After(@clock, 'tick', => @useCase.secondElapsed())

    After(@gui, 'startClicked', => @useCase.start())
    After(@gui, 'increaseRoundLengthClicked', => @useCase.increaseRoundLength())
    After(@gui, 'decreaseRoundLengthClicked', => @useCase.decreaseRoundLength())
    After(@gui, 'addBlindClicked', (blind) => @useCase.addBlind(blind))
    After(@gui, 'removeBlindClicked', (blind) => @useCase.removeBlind(blind))
