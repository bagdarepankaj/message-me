class User < ApplicationRecord
  validates :email, presence: true
  validates :password, presence: true
  has_many :messages

  has_secure_password

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
