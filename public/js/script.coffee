$ ->
  degToRad = (deg) -> deg * (Math.PI / 180)
  radToDeg = (rad) -> rad / (Math.PI / 180)
  pow = Math.pow

  scene = {}
  scene.circleDepth = 5
  scene.camDepth = 10
  scene.camAngle = 50

  state = {}
  state.angle = 0

  onDeviceOrientation = (lr, fb, dir) ->
    updatePanels(lr, fb, dir)

  window.addEventListener 'deviceorientation', (eventData) ->
    onDeviceOrientation( eventData.gamma, eventData.beta, eventData.alpha )
  
  updatePanels = (lr, fb, dir) ->
    $('.panel').each ->
      beta = dir
      alpha = parseInt($(this).data('angle'), 10)
      b_a = beta - alpha

      r = parseInt($(this).data('z'), 10)
      c = scene.camDepth

      camToObj = pow((pow(r,2) + pow(c,2) - 2*r*c*Math.cos(degToRad(b_a))), 0.5)
      
      p = (pow(c,2) + pow(camToObj,2) - pow(r,2)) / \
          (2*c*camToObj)

      gamma = radToDeg(Math.acos(p))
      objAngle = -1*(180 - (gamma))

      viewRange = [
        (dir - scene.camAngle/2)%360
        (dir + scene.camAngle/2)%360
      ]
      viewRatio = (objAngle - viewRange[0]) / (viewRange[1] - viewRange[0])
      $(this).css left: viewRatio * 100 + '%'

  setInterval (-> updatePanels(0,0, state.angle = ((state.angle+1) % 360))), 10

