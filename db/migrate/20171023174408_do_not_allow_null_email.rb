class DoNotAllowNullEmail < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :email, :string, false
  end
end
