class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @_current_user ||= User.find_by(id: session[:current_user_id])
  end

  private

  def logged_in?
    current_user.present?
  end

  def require_user
    if !logged_in?
      redirect_to login_path, notice: 'You must login first to access the page'
    end
  end
end
