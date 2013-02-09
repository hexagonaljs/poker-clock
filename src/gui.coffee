class Gui
  constructor: ->

  createTimer: =>
    source = $('#timer-template').html()
    template = Handlebars.compile(source)
    data = {currentTime: '00:00'}
    html = template(data)
    element = $(html)
    $('[data-element=main]').append(element)

  createBlinds: (blind) =>
    source = $('#blinds-template').html()
    template = Handlebars.compile(source)
    data = {currentBlind: blind.toString()}
    html = template(data)
    element = $(html)
    $('[data-element=main]').append(element)

  updateTimer: (duration) =>
    $('[data-element=timer]').html(duration.toString())

  updateBlind: (blind) =>
    $('[data-element=blind]').html(blind.toString())
