class CreateUsers < ActiveRecord::Migration[5.2]
  def change
   create_table :users do |t|
    t.string :name
    t.string :email
    t.string :password_digest
    t.string :user_name
    t.string :pro_bgc
    t.string :pro_icon
    t.string :location
    t.string :about
    t.string :tag
    t.timestamps null: false
   end
  end
end
