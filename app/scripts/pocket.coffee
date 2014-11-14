'use strict'

class Pocket

  State:
    OPEN: 'open'
    CLOSE: 'close'
  state: null

  OPEN_CLASS: 'pocket-open'
  LOCKED_CLASS: 'pocket-locked'

  element: null
  checkbox: null

  constructor: ->
    @state = @State.CLOSE

    @element = document.createElement 'div'
    @element.classList.add 'pocket'
    @element.innerText = 'Pocket'
    @element.addEventListener 'mouseover', @onMouseOver.bind(@)
    @element.addEventListener 'mouseleave', @onMouseLeave.bind(@)

    @checkbox = document.createElement 'input'
    @checkbox.setAttribute 'type', 'checkbox'
    @checkbox.classList.add 'lock'
    @checkbox.addEventListener 'change', @onLockChange.bind(@)
    @element.appendChild @checkbox

    document.body.appendChild @element

  onMouseOver: ->
    @state = @State.OPEN

    @element.classList.add @OPEN_CLASS

  onMouseLeave: ->
    @state = @State.CLOSE

    @element.classList.remove @OPEN_CLASS

  onLockChange: ->
    if @checkbox.checked
      @element.classList.add @LOCKED_CLASS
    else
      @element.classList.remove @LOCKED_CLASS


pocket = new Pocket()
