class Private::Message < ApplicationRecord
  # self.table_name = "private_messages"

  belongs_to :user
  belongs_to :conversation, foreign_key: :conversation_id, class_name: 'Private::Conversation'

end
