class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "chat_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.create!(user_id: current_user.id, text: data["message"])
    if message.present?
      ActionCable.server.broadcast "chat_room_channel" , message: message.text
    end
  end

end
