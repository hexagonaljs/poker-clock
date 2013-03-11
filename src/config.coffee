#<< duration
#<< blind

Config =
  getAvailableBlinds: ->
    Config.blinds.map (blind) -> new Blind(blind.small, blind.big)
  getEnabledBlinds: ->
    Config.blinds.findAll((blind) -> blind.enabled).map((blind) -> new Blind(blind.small, blind.big))
  getRoundDuration: ->
    new Duration(Config.round.duration * 60)
  round:
    duration: 15
  blinds: [
    small: 10
    big: 20
    enabled: true
  ,
    small: 15
    big: 30
    enabled: false
  ,
    small: 25
    big: 50
    enabled: true
  ,
    small: 50
    big: 100
    enabled: true
  ,
    small: 75
    big: 150
    enabled: false
  ,
    small: 100
    big: 200
    enabled: true
  ,
    small: 150
    big: 300
    enabled: false
  ,
    small: 200
    big: 400
    enabled: false
  ,
    small: 250
    big: 500
    enabled: true
  ,
    small: 500
    big: 1000
    enabled: false
  ,
    small: 1000
    big: 2000
    enabled: false
  ,
    small: 2500
    big: 5000
    enabled: false
  ,
    small: 5000
    big: 10000
    enabled: false
  ,
    small: 10000
    big: 20000
    enabled: false
  ,
    small: 25000
    big: 50000
    enabled: false
  ,
    small: 50000
    big: 100000
    enabled: false
  ]
