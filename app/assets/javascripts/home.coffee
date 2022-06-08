# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

messageCreate = (value) ->
  $.ajax
    url: '/message'
    type: 'POST'
    headers: 'X-CSRF-Token': $('[name="csrf-token"]')[0].content
    data: content: value
  return

$(document).on 'keypress', '[data-behavior~=chat_room_speaker]', (event) ->
  if event.keyCode is 13 # return/enter = send
    messageCreate(event.target.value)
    # App.chat_room.speak event.target.value
    event.target.value = ''
    event.preventDefault()

$(document).on 'click', '.button.submit', (event) ->
    value = event.target.previousElementSibling.value
    messageCreate(value)
    event.target.previousElementSibling.value = ''
    event.preventDefault()
