class Glue
  constructor: (@pokerClock, @gui, @storage, @clock)->
    LogAll(@pokerClock)
    LogAll(@gui)

    After(@pokerClock, 'setup', =>
      @gui.switchToSetup()
      @gui.updateSelectedBlinds(@pokerClock.availableBlinds, @pokerClock.enabledBlinds)
      @gui.updateRoundLength(@pokerClock.round)
    )

    After(@pokerClock, 'start', =>
      @clock.start()
      @gui.switchToMainView()
      @gui.updateTimeLeft(@pokerClock.round.timeLeft())
      @gui.updateBlinds(@pokerClock.currentBlind()))

    After(@pokerClock, 'restart', =>
      @clock.stop()
      @gui.switchToSetup())

    After(@pokerClock, 'pause', => @clock.toggle())

    After(@pokerClock, 'secondElapsed', => @gui.updateTimeLeft(@pokerClock.round.timeLeft()))
    After(@pokerClock, 'switchToNextRound', => @gui.updateBlinds(@pokerClock.currentBlind()))
    AfterAll(@pokerClock, [
      'setRoundLength',
      'increaseRoundLength',
      'decreaseRoundLength'],
      => @gui.updateRoundLength(@pokerClock.round))
    AfterAll(@pokerClock, [
      'addBlind',
      'removeBlind'],
      => @gui.updateSelectedBlinds(@pokerClock.availableBlinds, @pokerClock.enabledBlinds))


    After(@clock, 'tick', => @pokerClock.secondElapsed())

    After(@gui, 'startClicked', => @pokerClock.start())
    After(@gui, 'restartClicked', => @pokerClock.restart())
    After(@gui, 'pauseClicked', => @pokerClock.pause())
    After(@gui, 'increaseRoundLengthClicked', => @pokerClock.increaseRoundLength())
    After(@gui, 'decreaseRoundLengthClicked', => @pokerClock.decreaseRoundLength())
    After(@gui, 'addBlindClicked', (blind) => @pokerClock.addBlind(blind))
    After(@gui, 'removeBlindClicked', (blind) => @pokerClock.removeBlind(blind))
