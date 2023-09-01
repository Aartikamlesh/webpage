class AddUserIdToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :user_id, :integer
    add_index :employees, :user_id
  end
end
