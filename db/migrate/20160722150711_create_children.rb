class CreateChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :children do |t|
      t.string :name, null:false
      t.integer :parent_id, null:false
      t.string :allergies
      t.date :birthday
      t.timestamps(null:false)
    end
  end
end
