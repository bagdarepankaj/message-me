# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'keypress', '[data-behavior~=chat_room_speaker]', (event) ->
  if event.keyCode is 13 # return/enter = send
    $.ajax({
      url: '/message',
      type: 'POST',
      headers: { "X-CSRF-Token": $('[name="csrf-token"]')[0].content },
      data: { content: event.target.value }
    })
    # App.chat_room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
