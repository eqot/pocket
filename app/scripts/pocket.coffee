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
  sortable: null

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

    @addGroup 'Test'

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
    group = document.createElement 'div'
    group.classList.add @GROUP_CLASS

    @addLabel group, label

    list = document.createElement 'ul'
    list.classList.add @LIST_CLASS
    $(list).sortable({
      connectWith: '.' + @LIST_CLASS
    }).disableSelection()
    group.appendChild list

    @element.appendChild group

  addLabel: (parent, label) ->
    text = document.createElement 'span'
    text.classList.add @LABEL_CLASS
    text.innerText = label
    text.addEventListener 'dblclick', @editLabel.bind(@)
    parent.appendChild text

    textArea = document.createElement 'textarea'
    textArea.classList.add @TEXTAREA_CLASS
    textArea.setAttribute 'rows', 1
    textArea.addEventListener 'keydown', @onLabelKeyDown.bind(@)
    textArea.pocketText = text
    text.pocketTextArea = textArea
    parent.appendChild textArea

  editLabel: (event) ->
    text  = event.target
    textArea = text.pocketTextArea
    textArea.value = text.innerText
    textArea.focus()

    group = text.parentElement
    @changeGroupState group, @State.EDIT

  onLabelKeyDown: (event) ->
    if event.keyCode is 13  # Return key
      event.preventDefault()

      textArea = event.target
      text = textArea.pocketText
      if textArea.value.length > 0
        text.innerText = textArea.value

      group = event.target.parentElement
      @changeGroupState group, @State.NORMAL

    else if event.keyCode is 27  # ESC key
      group = event.target.parentElement
      @changeGroupState group, @State.NORMAL

  changeGroupState: (element, state) ->
    switch state
      when @State.EDIT
        element.classList.add @LABEL_EDIT_CLASS
      else
        element.classList.remove @LABEL_EDIT_CLASS

  bindSortables: ->
    $('#sortable1, #sortable2, #sortable3').sortable({
      connectWith: '.' + @LIST_CLASS
    }).disableSelection()


pocket = new Pocket()
