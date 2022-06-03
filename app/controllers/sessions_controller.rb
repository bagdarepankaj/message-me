class SessionsController < ApplicationController

  def new
  end

  def create
    @_current_user = User.find_by(email: params[:email])
    respond_to do |format|
      if @_current_user && (@_current_user.password == params[:password])
        session[:current_user_id] = @_current_user.id
        format.html { redirect_to users_path, notice: 'Successfully logged in'}
      else
        format.html { redirect_to login_path, notice: 'Invalid email or password'}
      end
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path, notice: 'User logged out successfully'
  end

end
