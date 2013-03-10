#<< utils
#<< local_storage
#<< use_case
#<< gui
#<< glue
#<< clock

class App
  constructor: ->
    clock        = new Clock()
    useCase      = new UseCase()
    gui          = new Gui()
    localStorage = new LocalStorage("app")
    glue         = new Glue(useCase, gui, localStorage, clock)

    useCase.setup()

new App()

