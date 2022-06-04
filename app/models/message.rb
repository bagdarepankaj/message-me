class Message < ApplicationRecord
  belongs_to :user

  after_create_commit { MessageBroadcastJob.deliver_later(self) }

end
