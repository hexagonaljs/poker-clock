#<< utils
#<< poker_clock
#<< gui
#<< glue
#<< clock
#<< config

class App
  constructor: ->
    clock        = new Clock()
    round        = new Round(Config.getRoundDuration())
    pokerClock   = new PokerClock(round, Config.getAvailableBlinds(), Config.getEnabledBlinds())
    gui          = new Gui()
    glue         = new Glue(pokerClock, gui, clock)

    pokerClock.setup()

new App()

