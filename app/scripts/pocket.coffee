'use strict'

class Pocket
  constructor: ->
    element = document.createElement 'div'
    element.classList.add 'pocket'
    element.innerText = 'Pocket'
    document.body.appendChild element


pocket = new Pocket()
