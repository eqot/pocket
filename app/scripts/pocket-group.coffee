'use strict'

class PocketGroup

  Class:
    GROUP: 'pocket-group'
    LABEL: 'pocket-label'
    TEXTAREA: 'pocket-textarea'
    EDIT: 'pocket-edit'
    LIST: 'pocket-list'

  element: null
  label: null
  textArea: null
  list: null

  constructor: (label) ->
    @element = document.createElement 'div'
    @element.classList.add @Class.GROUP

    @label = document.createElement 'span'
    @label.classList.add @Class.LABEL
    @label.innerText = label
    @label.addEventListener 'dblclick', @editLabel.bind(@)
    @element.appendChild @label

    @textArea = document.createElement 'textarea'
    @textArea.classList.add @Class.TEXTAREA
    @textArea.setAttribute 'rows', 1
    @textArea.addEventListener 'keydown', @onKeyDown.bind(@)
    @element.appendChild @textArea

    @list = document.createElement 'ul'
    @list.classList.add @Class.LIST
    $(@list).sortable({
      connectWith: '.' + @Class.LIST
    }).disableSelection()
    @element.appendChild @list

    return @element

  editLabel: (event) ->
    event.preventDefault()

    @element.classList.add @Class.EDIT

    @textArea.value = @label.innerText
    @textArea.focus()
    @textArea.select()

  onKeyDown: (event) ->
    if event.keyCode is 13  # Return key
      event.preventDefault()

      if @textArea.value.length > 0
        @label.innerText = @textArea.value

      @element.classList.remove @Class.EDIT

    else if event.keyCode is 27  # ESC key
      event.preventDefault()

      @element.classList.remove @Class.EDIT


window.PocketGroup = PocketGroup
