class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.integer :user_id
      t.integer :zipcode, default: 60654
      t.integer :radius, default: 10
      t.boolean :vaccinate
      t.string :religion
      t.string :parenting_style
      t.string :date_night
      t.string :shopping_prefs
      t.string :fav_activities
      t.string :music
      t.string :marital_status
      t.string :bio
      t.string :gender
      t.timestamps(null:false)
    end
  end
end
