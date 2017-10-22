class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :subect
      t.text :body
      t.boolean :delivered

      t.timestamps
    end
  end
end
