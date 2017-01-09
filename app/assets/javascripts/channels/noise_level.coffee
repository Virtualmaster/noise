App.noise_level = App.cable.subscriptions.create "NoiseLevelChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    root = exports ? this
    root.max_noise_value = 0

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    root = exports ? this
    if (data.level > root.max_noise_value)
      root.max_noise_value = data.level
 
    $('#highcharts_container').highcharts().series[0].addPoint(data.level,true,true,false)
    $('#highcharts_container').highcharts().series[1].addPoint(root.max_noise_value,true,true,false)

