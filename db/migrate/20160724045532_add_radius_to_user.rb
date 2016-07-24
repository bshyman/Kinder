class AddRadiusToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :radius, :integer, default: 10
  end
end
