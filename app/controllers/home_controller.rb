class HomeController < ApplicationController
  before_action :require_user

  def index
    @messages = Message.all
    @users = User.all
  end

end
