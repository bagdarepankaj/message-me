class CreatePrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :private_messages do |t|

      t.text :body
      t.belongs_to :conversation, index: true
      t.references :user, foreign_key: true
      t.boolean :seen, default: false

      t.timestamps
    end
  end
end
