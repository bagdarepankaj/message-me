class Private::ConversationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "private_conversation_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  end
end
