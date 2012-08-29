$ ->

  state = {}

  state.angle = 0

  onDeviceOrientation = (lr, fb, dir) ->
    updatePanels(lr, fb, dir)

  window.addEventListener 'deviceorientation', (eventData) ->
    onDeviceOrientation( eventData.gamma, eventData.beta, eventData.alpha )
  
  updatePanels = (lr, fb, dir) ->
    $('.panel').css left: (state.angle/360) * 100 + '%'

