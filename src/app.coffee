#<< utils
#<< use_case
#<< gui
#<< glue
#<< clock
#<< config

class App
  constructor: ->
    clock        = new Clock()
    round        = new Round(Config.getRoundDuration())
    useCase      = new UseCase(round, Config.getAvailableBlinds(), Config.getEnabledBlinds())
    gui          = new Gui()
    glue         = new Glue(useCase, gui, localStorage, clock)

    useCase.setup()

new App()

