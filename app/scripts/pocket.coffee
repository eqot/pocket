'use strict'

class Pocket

  Class:
    BASE: 'pocket'
    LOCK: 'pocket-lock'
    STATE_OPEN: 'pocket-open'
    STATE_LOCKED: 'pocket-locked'

  element: null
  checkbox: null

  constructor: ->
    @element = document.createElement 'div'
    @element.classList.add @Class.BASE
    @element.classList.add @Class.STATE_LOCKED
    @element.innerText = 'Pocket'
    @element.addEventListener 'mouseover', @onMouseOver.bind(@)
    @element.addEventListener 'mouseleave', @onMouseLeave.bind(@)

    @checkbox = document.createElement 'input'
    @checkbox.setAttribute 'type', 'checkbox'
    @checkbox.classList.add @Class.LOCK
    @checkbox.addEventListener 'change', @onLockChange.bind(@)
    @element.appendChild @checkbox

    document.body.appendChild @element

    @addGroup 'foo'
    @addGroup 'bar'

    @bindSortables()

  onMouseOver: ->
    @element.classList.add @Class.STATE_OPEN

  onMouseLeave: ->
    @element.classList.remove @Class.STATE_OPEN

  onLockChange: ->
    if @checkbox.checked
      @element.classList.add @Class.STATE_LOCKED
    else
      @element.classList.remove @Class.STATE_LOCKED

  addGroup: (label) ->
    @element.appendChild new PocketGroup label

  bindSortables: ->
    $('#sortable1, #sortable2, #sortable3').sortable({
      connectWith: '.' + @Class.LIST
    }).disableSelection()


pocket = new Pocket()
