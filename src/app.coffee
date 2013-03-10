#<< utils
#<< local_storage
#<< use_case
#<< gui
#<< glue
#<< clock
#<< timer

class App
  constructor: ->
    clock        = new Clock()
    timer        = new Timer()
    useCase      = new UseCase(clock)
    gui          = new Gui()
    localStorage = new LocalStorage("app")
    glue         = new Glue(useCase, gui, localStorage, timer, clock)

    useCase.setup()

new App()

