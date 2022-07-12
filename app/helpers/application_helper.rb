module ApplicationHelper

  def all_users
    return User.all_except(current_user)
  end
end
