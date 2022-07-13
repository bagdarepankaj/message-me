class Private::ConversationsController < ApplicationController
  before_action :get_recipient, only: [:new, :create]

  def new
    @conversation = get_conversation(current_user.id, params[:recipient_id])
    @conversation ||= current_user.private_conversations.create(recipient_id: params[:recipient_id])
    @messages = @conversation.try(:messages)
    respond_to do |format|
      format.js {}
    end
  end

  def create
    recipient_id = params[:private_conversation][:recipient_id]
    sender_id = params[:private_conversation][:sender_id]
    @conversation = get_conversation(sender_id, recipient_id)
    @conversation.update(permited_params)
    MessageBroadcastJob.perform_later(@conversation)
    respond_to do |format|
      format.js {}
    end
  end

  private

    def get_recipient
      @recipient = User.find_by(id: params[:recipient_id] || params[:private_conversation][:recipient_id])
    end

    def permited_params
      params.require(:private_conversation).permit(:sender_id, :recipient_id, messages_attributes: [:body, :user_id])
    end
end
