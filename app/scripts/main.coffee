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

pocket = new Pocket('sortable')

test = querySelector '#test'
test.addEventListener 'click', ->
  value = pocket.value()
  console.log JSON.stringify value

test2 = querySelector '#test2'
test2.addEventListener 'click', ->
  value = '[{"label":"foo2","items":["Item 1"]},{"label":"bar2","items":["Item 3","Item 4"]},{"label":"Test","items":["Item 3"]}]'
  pocket.value JSON.parse value
