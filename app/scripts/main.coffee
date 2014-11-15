'use strict'

querySelector = document.querySelector.bind document

navdrawerContainer = querySelector '.navdrawer-container'
body = document.body
appbarElement = querySelector '.app-bar'
menuBtn = querySelector '.menu'
main = querySelector 'main'

closeMenu = ->
  body.classList.remove 'open'
  appbarElement.classList.remove 'open'
  navdrawerContainer.classList.remove 'open'

toggleMenu = ->
  body.classList.toggle 'open'
  appbarElement.classList.toggle 'open'
  navdrawerContainer.classList.toggle 'open'
  navdrawerContainer.classList.add 'opened'

main.addEventListener 'click', closeMenu
menuBtn.addEventListener 'click', toggleMenu
navdrawerContainer.addEventListener 'click', (event) ->
  if (event.target.nodeName is 'A' || event.target.nodeName is 'LI')
    closeMenu()

new Pocket('sortable')
