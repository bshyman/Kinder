class RemoveMultipleColumnsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :zipcode
    remove_column :users, :radius
    remove_column :users, :vaccinate
    remove_column :users, :religion
    remove_column :users, :parenting_style
    remove_column :users, :date_night
    remove_column :users, :shopping_prefs
    remove_column :users, :fav_activities
    remove_column :users, :music
    remove_column :users, :marital_status
    remove_column :users, :bio
    remove_column :users, :gender
  end
end
