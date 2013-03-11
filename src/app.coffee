#<< utils
#<< local_storage
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
    localStorage = new LocalStorage("app")
    glue         = new Glue(useCase, gui, localStorage, clock)

    useCase.setup()

new App()

