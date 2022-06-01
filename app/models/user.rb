class User < ApplicationRecord
  validates :email, :password, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
