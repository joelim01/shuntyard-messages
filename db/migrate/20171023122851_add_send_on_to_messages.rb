class AddSendOnToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :send_on, :date
  end
end
