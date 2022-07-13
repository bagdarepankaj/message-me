class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(conversation)
    # Broadcast to sender
    ActionCable.server.broadcast "private_conversation_#{conversation.sender.id}", message: render_message(conversation.last_message)
    # Broadcast to receiver
    ActionCable.server.broadcast "private_conversation_#{conversation.receiver.id}", message: render_message(conversation.last_message)
    # ActionCable.server.broadcast "chat_room_channel", message: render_message(message)
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'private/messages/message', locals: { message: message })
  end
end
