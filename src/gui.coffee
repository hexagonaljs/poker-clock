class Gui
  constructor: ->

  updateTimer: (duration) =>
    minutes = duration.minutes().pad(2)
    seconds = duration.seconds().pad(2)
    source = $('#timer-template').html()
    template = Handlebars.compile(source)
    data = {currentMinute: minutes, currentSecond: seconds}
    html = template(data)
    element = $(html)
    $('[data-element=timer]').html(element)

  updateBlinds: (blind) =>
    console.log('updateBlinds', blind)
    source = $('#blinds-template').html()
    template = Handlebars.compile(source)
    data = {smallBlind: blind.small, bigBlind: blind.big}
    html = template(data)
    element = $(html)
    $('[data-element=blinds]').html(element)
