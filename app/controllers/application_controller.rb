class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :get_conversation

  def current_user
    @_current_user ||= User.find_by(id: session[:current_user_id])
  end

  def get_conversation(id1, id2)
    Private::Conversation.between_users(id1, id2).try(:first)
  end

  private

  def logged_in?
    current_user.present?
  end

  def require_user
    if !logged_in?
      redirect_to root_path, notice: 'You must login first to access the page'
    end
  end
end
