class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && (@user.password == params[:password])
      @_current_user = @user
      session[:current_user_id] = @_current_user.id
      redirect_to users_path, notice: 'Successfully logged in'
    else
      redirect_to login_path, notice: 'Invalid email or password'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path, notice: 'User logged out successfully'
  end

end
