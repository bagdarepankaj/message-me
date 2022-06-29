class Private::Conversation < ApplicationRecord
  # self.table_name = "private_conversations"

  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :receiver, foreign_key: :recipient_id, class_name: 'User'
  has_many :messages, foreign_key: :conversation_id, class_name: 'Private::Message'

end
