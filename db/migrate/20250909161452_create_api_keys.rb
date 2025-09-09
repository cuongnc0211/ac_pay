class CreateApiKeys < ActiveRecord::Migration[8.1]
  def change
    create_table :api_keys do |t|
      t.string :title
      t.references :app, null: false, foreign_key: true
      t.string :client_id
      t.string :client_secret
      t.string :token

      t.timestamps
    end

    add_index :api_keys, :client_id, unique: true
    add_index :api_keys, :client_secret, unique: true
  end
end
