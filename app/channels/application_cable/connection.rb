module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      session = cookies.encrypted[Rails.application.config.session_options[:key]]
      self.current_user = find_verified_user(session["current_user_id"])
    end

    private

    def find_verified_user(id)
      user = User.find_by(id: id)
      user ? user : reject_unauthorized_connection
    end
  end
end
