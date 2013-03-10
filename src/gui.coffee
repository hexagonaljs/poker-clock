class Gui
  constructor: ->
    $('[data-role=start]').click => @startClicked()
    $('[data-role=increase-round-length]').click => @increaseRoundLengthClicked()
    $('[data-role=decrease-round-length]').click => @decreaseRoundLengthClicked()

  startClicked: ->

  increaseRoundLengthClicked: ->

  decreaseRoundLengthClicked: ->

  updateRoundLength: (round) ->
    data = {roundLength: round.lengthInMinutes()}
    element = @renderElement('#round-template', data)
    $('[data-element=round-length]').html(element)

  updateTimeLeft: (timeLeft) =>
    minutes = timeLeft.minutes().pad(2)
    seconds = timeLeft.seconds().pad(2)
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
