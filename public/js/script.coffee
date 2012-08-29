$ ->

  state = {}

  state.angle = 0

  #updatePosition = ->
    #state.angle = (state.angle + 5) % 360
    #
    #

  $(window).on 'deviceorientation', (e) ->
    #alert(e.alpha)
    state.angle = e.alpha
    document.write(state.angle)
    
  
  updatePanels = ->
    $('.panel').css left: (state.angle/360) * 100 + '%'

  #setInterval updatePosition, 10
  setInterval updatePanels, 10

  
  
