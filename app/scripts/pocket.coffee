'use strict'

initialize = ->
  element = document.createElement 'div'
  element.classList.add 'pocket'
  element.innerText = 'Pocket'
  document.body.appendChild element

initialize()
