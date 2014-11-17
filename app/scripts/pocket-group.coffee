'use strict'

class PocketGroup

  Class:
    GROUP: 'pocket-group'
    LABEL: 'pocket-label'
    TEXTAREA: 'pocket-textarea'
    EDIT: 'pocket-edit'
    LIST: 'pocket-list'
    PLACEHOLDER: 'pocket-placeholder'

  className: null

  element: null
  label: null
  textArea: null
  list: null

  constructor: (className, label, items) ->
    @className = className || ''

    @element = document.createElement 'div'
    @element.classList.add @Class.GROUP

    @label = document.createElement 'span'
    @label.classList.add @Class.LABEL
    @label.addEventListener 'dblclick', @editLabel.bind(@)
    @element.appendChild @label

    @textArea = document.createElement 'textarea'
    @textArea.classList.add @Class.TEXTAREA
    @textArea.setAttribute 'rows', 1
    @textArea.setAttribute 'placeholder', 'Label'
    @textArea.addEventListener 'keydown', @onKeyDown.bind(@)
    @element.appendChild @textArea

    @list = document.createElement 'ul'
    @list.classList.add @Class.LIST
    @list.classList.add @className
    $(@list).sortable({
      connectWith: '.' + @className
      placeholder: @Class.PLACEHOLDER
    }).disableSelection()
    @element.appendChild @list

    if typeof label is 'string'
      @label.innerText = label
    else
      @element.classList.add @Class.EDIT

      @textArea.focus()
      @textArea.select()

    @setValue items

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

  addItem: (label) ->
    item = document.createElement 'li'
    item.innerText = label
    @list.appendChild item

  value: (value) ->
    if value?
      @setValue value
    else
      return @getValue()

  setValue: (value) ->
    if value?
      for item in value
        @addItem item

  getValue: ->
    value =
      label: @label.innerText
      items: []

    for item in @list.querySelectorAll 'li'
      value.items.push item.innerText

    return value


window.PocketGroup = PocketGroup
