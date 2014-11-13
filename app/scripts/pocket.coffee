'use strict'

class Pocket

  State:
    OPEN: 'open'
    CLOSE: 'close'
  state: null

  OPEN_CLASS: 'pocket-open'

  element: null

  constructor: ->
    @state = @State.CLOSE

    @element = document.createElement 'div'
    @element.classList.add 'pocket'
    @element.innerText = 'Pocket'

    @element.addEventListener 'mouseover', @onMouseOver.bind(@)
    @element.addEventListener 'mouseleave', @onMouseLeave.bind(@)

    document.body.appendChild @element

  onMouseOver: ->
    @state = @State.OPEN

    @element.classList.add @OPEN_CLASS

  onMouseLeave: ->
    @state = @State.CLOSE

    @element.classList.remove @OPEN_CLASS


pocket = new Pocket()
