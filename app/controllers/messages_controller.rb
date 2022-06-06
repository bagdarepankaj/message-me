class MessagesController < ApplicationController
  before_action :require_user

  def create
    msg = current_user.messages.build(text: params[:content])
    if msg.save
      ActionCable.server.broadcast "chat_room_channel", message: message_render(msg)
    else
      render 'home/index', errors: msg.errors.messages
    end
  end

  private

  def message_render(message)
    # render 'messages/_message', message: message
    render(partial: 'messages/message', locals: {message: message})
  end
end
