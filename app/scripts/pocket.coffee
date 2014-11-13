'use strict'

class Pocket

  State:
    OPEN: 'open'
    CLOSE: 'close'
  state: null

  constructor: ->
    @state = @State.CLOSE

    element = document.createElement 'div'
    element.classList.add 'pocket'
    element.innerText = 'Pocket'

    element.addEventListener 'mouseover', @onMouseOver.bind(@)
    element.addEventListener 'mouseleave', @onMouseLeave.bind(@)

    document.body.appendChild element

  onMouseOver: ->
    @state = @State.OPEN

  onMouseLeave: ->
    @state = @State.CLOSE


pocket = new Pocket()
