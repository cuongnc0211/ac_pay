class CreateApps < ActiveRecord::Migration[8.1]
  def change
    create_table :apps do |t|
      t.string :title
      t.string :status
      t.text :decsription

      t.timestamps
    end
  end
end
