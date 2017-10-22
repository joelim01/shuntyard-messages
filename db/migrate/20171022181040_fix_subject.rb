class FixSubject < ActiveRecord::Migration[5.1]

  def self.up
    rename_column :messages, :subect, :subject
  end

  def self.down
    rename_column :messages, :subject, :subect
  end
end
