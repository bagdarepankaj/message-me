class HomeController < ApplicationController
  before_action :require_user

  def index
    @messages = Message.all
    @users = User.all_except(current_user)
  end

end
