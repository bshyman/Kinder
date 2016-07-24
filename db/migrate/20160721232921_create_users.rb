class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :zipcode
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :vaccinate
      t.string :religion
      t.string :parenting_style
      t.string :date_night
      t.string :shopping_prefs
      t.string :fav_activities
      t.string :music
      t.string :avatar
      t.string :bio
      t.string :gender
      t.timestamps(null:false)
    end
  end
end
