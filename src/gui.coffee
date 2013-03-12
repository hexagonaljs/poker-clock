class Gui
  constructor: ->
    $('[data-role=start]').click => @startClicked()
    $('[data-role=restart]').click => @restartClicked()
    $('[data-role=increase-round-length]').click => @increaseRoundLengthClicked()
    $('[data-role=decrease-round-length]').click => @decreaseRoundLengthClicked()

  startClicked: ->

  restartClicked: ->

  increaseRoundLengthClicked: ->

  decreaseRoundLengthClicked: ->

  addBlindClicked: (blind) ->

  removeBlindClicked: (blind) ->

  switchToSetup: =>
    @hideMainView()
    @showSetup()

  switchToMainView: =>
    @hideSetup()
    @showMainView()

  updateRoundLength: (round) ->
    data = {roundLength: round.lengthInMinutes()}
    element = @renderElement('#round-template', data)
    $('[data-element=round-length]').html(element)

  updateSelectedBlinds: (availableBlinds, enabledBlinds) =>
    data = {blinds: availableBlinds.all()}
    element = @renderElement('#blinds-selection-template', data)
    $('[data-element=blinds-selection]').html(element)
    availableBlinds.each (blind) =>
      element = @getElementForBlind(availableBlinds.indexOf(blind))
      if enabledBlinds.contains(blind)
        element.click => @removeBlindClicked(blind)
        element.addClass('success')
        element.removeClass('secondary')
      else
        element.removeClass('success')
        element.addClass('secondary')
        element.click => @addBlindClicked(blind)

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

  showSetup: =>
    @getSetupElement().show()

  hideSetup: =>
    @getSetupElement().hide()

  showMainView: =>
    @getMainViewElement().show()

  hideMainView: =>
    @getMainViewElement().hide()

  getSetupElement: ->
    $('[data-element=setup]')

  getMainViewElement: ->
    $('[data-element=main]')

  getElementForBlind: (index) ->
    $("[data-blind-id=#{index}]")

  renderElement: (template, data) ->
    source = $(template).html()
    template = Handlebars.compile(source)
    html = template(data)
    element = $(html)
