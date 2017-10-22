class CreateMessagesRecipients < ActiveRecord::Migration[5.1]
  def change
    create_table :messages_recipients, :id => false do |t|
      t.integer :message_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
