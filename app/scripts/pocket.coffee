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

  groups: null

  constructor: (className) ->
    @className = className || 'pocket-list'

    @element = document.createElement 'div'
    @element.classList.add @Class.BASE
    # @element.classList.add @Class.STATE_LOCKED
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

    @groups = []

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

  addGroup: (label, items) ->
    group = new PocketGroup @className, label, items
    @groups.push group
    @element.appendChild group.element

  bindSortables: ->
    $('.' + @className).sortable({
      connectWith: '.' + @className
      placeholder: 'pocket-placeholder'
    }).disableSelection()

  value: (value) ->
    if value?
      @setValue value
    else
      return @getValue()

  clean: (value) ->
    for group in @groups
      group.element.remove()

    @groups = []

  setValue: (value) ->
    @clean()

    for group in value
      @addGroup group.label, group.items

  getValue: ->
    value = []
    for group in @groups
      value.push group.value()

    return value


window.Pocket = Pocket
