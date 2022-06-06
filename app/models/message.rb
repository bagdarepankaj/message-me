class Message < ApplicationRecord
  belongs_to :user
  validates :text, presence: true
  # after_create_commit { MessageBroadcastJob.deliver_later(self) }
end
