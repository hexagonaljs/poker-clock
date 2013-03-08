class Gui
  constructor: ->
    $('[data-role=start]').click => @startClicked()

  startClicked: ->

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

  hideSetup: ->
    $('[data-element=setup]').hide()

  renderElement: (template, data) ->
    source = $(template).html()
    template = Handlebars.compile(source)
    html = template(data)
    element = $(html)
