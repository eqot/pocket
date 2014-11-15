'use strict'

class Pocket

  State:
    OPEN: 'open'
    CLOSE: 'close'
    NORMAL: 'normal'
    EDIT: 'edit'
  state: null

  OPEN_CLASS: 'pocket-open'
  LOCKED_CLASS: 'pocket-locked'
  GROUP_CLASS: 'pocket-group'
  LIST_CLASS: 'pocket-list'
  LABEL_CLASS: 'pocket-label'
  TEXTAREA_CLASS: 'pocket-textarea'
  LABEL_EDIT_CLASS: 'pocket-label-edit'

  element: null
  checkbox: null

  constructor: ->
    @state = @State.CLOSE

    @element = document.createElement 'div'
    @element.classList.add 'pocket'
    @element.classList.add @LOCKED_CLASS
    @element.innerText = 'Pocket'
    @element.addEventListener 'mouseover', @onMouseOver.bind(@)
    @element.addEventListener 'mouseleave', @onMouseLeave.bind(@)

    @checkbox = document.createElement 'input'
    @checkbox.setAttribute 'type', 'checkbox'
    @checkbox.classList.add 'lock'
    @checkbox.addEventListener 'change', @onLockChange.bind(@)
    @element.appendChild @checkbox

    document.body.appendChild @element

    @addGroup 'foo'
    @addGroup 'bar'

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

  addGroup: (label) ->
    @element.appendChild new PocketGroup label

  bindSortables: ->
    $('#sortable1, #sortable2, #sortable3').sortable({
      connectWith: '.' + @LIST_CLASS
    }).disableSelection()


pocket = new Pocket()
