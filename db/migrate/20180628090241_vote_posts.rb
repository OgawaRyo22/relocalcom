class VotePosts < ActiveRecord::Migration[5.2]
  def change
   create_table :tasks do |t|
    t.references :user
    t.string :title
    t.string :description
    t.string :location
    t.string :img
    t.timestamps null: false
   end
  end
end
