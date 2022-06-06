App.chat_room = App.cable.subscriptions.create "ChatRoomChannel",

  # Called when the subscription is ready for use on the server
  connected: ->

  # Called when the subscription has been terminated by the server
  disconnected: ->

  # Called when there's incoming data on the websocket for this channel
  received: (data) ->
    $('#messages').append data['message']

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
