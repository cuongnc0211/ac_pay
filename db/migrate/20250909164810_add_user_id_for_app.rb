class AddUserIdForApp < ActiveRecord::Migration[8.1]
  def change
    add_column :apps, :user_id, :bigint
    add_index :apps, :user_id
    add_foreign_key :apps, :users
  end
end
