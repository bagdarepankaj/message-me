class SessionsController < ApplicationController
  before_action :already_logged_in, except: :destroy

  def new
  end

  def create
    @_current_user = User.find_by(email: params[:email])
    begin
      if @_current_user && @_current_user.authenticate(params[:password])
        session[:current_user_id] = @_current_user.id
        redirect_to root_path, notice: 'Successfully logged in'
      else
        redirect_to login_path, notice: 'Invalid email or password'
      end
    rescue => e
      redirect_to login_path, notice: 'Something went wrong please try again'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to login_path, notice: 'User logged out successfully'
  end

  private

  def already_logged_in
    if logged_in?
      redirect_to root_path, notice: 'You are already logged in'
    end
  end

end
