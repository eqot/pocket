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
  sortable: null

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

    @sortable = document.createElement 'ul'
    @sortable.setAttribute 'id', 'sortable3'
    @sortable.classList.add 'connectedSortable'
    @element.appendChild @sortable

    document.body.appendChild @element

    @bindSortables()

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

  bindSortables: ->
    $('#sortable1, #sortable2, #sortable3').sortable({
      connectWith: '.connectedSortable'
    }).disableSelection()


pocket = new Pocket()
