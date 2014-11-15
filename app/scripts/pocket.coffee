'use strict'

class Pocket

  Class:
    BASE: 'pocket'
    BUTTON: 'pocket-button'
    LOCK: 'pocket-lock'
    STATE_OPEN: 'pocket-open'
    STATE_LOCKED: 'pocket-locked'

  className: null

  element: null
  checkbox: null

  constructor: (className) ->
    @className = className || 'pocket-list'

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

    @button = document.createElement 'button'
    @button.classList.add @Class.BUTTON
    @button.innerText = '+'
    @button.addEventListener 'click', @addGroup.bind(@)
    @element.appendChild @button

    document.body.appendChild @element

    @bindSortables()

    @addGroup 'foo'
    @addGroup 'bar'

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
    if typeof label is 'string'
      @element.appendChild new PocketGroup @className, label
    else
      @element.appendChild new PocketGroup @className

  bindSortables: ->
    $('.' + @className).sortable({
      connectWith: '.' + @className
      placeholder: 'pocket-placeholder'
    }).disableSelection()


window.Pocket = Pocket
