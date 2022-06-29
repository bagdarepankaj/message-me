App.chat_room = App.cable.subscriptions.create "ChatRoomChannel",

  # Called when the subscription is ready for use on the server
  connected: ->

  # Called when the subscription has been terminated by the server
  disconnected: ->

  # Called when there's incoming data on the websocket for this channel
  received: (data) ->
    $('#messages').append data['message']
    # scroll down to last message in the chatbox on new message
    msgDiv = $('#messages')
    height = msgDiv.height() +  msgDiv.children()[0].scrollHeight
    $('#message-container').scrollTop height
