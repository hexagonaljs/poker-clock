class Gui
  constructor: ->

  updateTimer: (duration) =>
    minutes = duration.minutes().pad(2)
    seconds = duration.seconds().pad(2)
    data = {currentMinute: minutes, currentSecond: seconds}
    element = @renderElement('#timer-template', data)
    $('[data-element=timer]').html(element)

  updateBlinds: (blind) =>
    data = {smallBlind: blind.small, bigBlind: blind.big}
    element = @renderElement('#blinds-template', data)
    $('[data-element=blinds]').html(element)

  renderElement: (template, data) ->
    source = $(template).html()
    template = Handlebars.compile(source)
    html = template(data)
    element = $(html)
