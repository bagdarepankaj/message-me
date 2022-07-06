class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :messages

  has_secure_password

  scope :all_except, -> (user) { where.not(id: user.id) }

  def full_name
    "#{self.first_name.try(:capitalize)} #{self.last_name.try(:capitalize)}"
  end

end
