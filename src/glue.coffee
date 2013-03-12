class Glue
  constructor: (@useCase, @gui, @storage, @clock)->
    LogAll(@useCase)
    LogAll(@gui)

    After(@useCase, 'setup', =>
      @gui.switchToSetup()
      @gui.updateSelectedBlinds(@useCase.availableBlinds, @useCase.enabledBlinds)
      @gui.updateRoundLength(@useCase.round)
    )

    After(@useCase, 'start', =>
      @clock.start()
      @gui.switchToMainView()
      @gui.updateTimeLeft(@useCase.round.timeLeft())
      @gui.updateBlinds(@useCase.currentBlind()))

    After(@useCase, 'restart', => @gui.switchToSetup())

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
      => @gui.updateSelectedBlinds(@useCase.availableBlinds, @useCase.enabledBlinds))


    After(@clock, 'tick', => @useCase.secondElapsed())

    After(@gui, 'startClicked', => @useCase.start())
    After(@gui, 'restartClicked', => @useCase.restart())
    After(@gui, 'increaseRoundLengthClicked', => @useCase.increaseRoundLength())
    After(@gui, 'decreaseRoundLengthClicked', => @useCase.decreaseRoundLength())
    After(@gui, 'addBlindClicked', (blind) => @useCase.addBlind(blind))
    After(@gui, 'removeBlindClicked', (blind) => @useCase.removeBlind(blind))
