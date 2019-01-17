class CreateUstags < ActiveRecord::Migration[5.2]
  def change
    create_table :ustags do |t|
      t.string :ustag
      t.timestamps null: false
     end
  end
end
