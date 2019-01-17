class CreateCentralUser < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tags do |t|
      t.integer :ustag_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
