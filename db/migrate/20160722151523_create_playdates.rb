class CreatePlaydates < ActiveRecord::Migration[5.0]
  def change
    create_table :playdates do |t|
       t.string :title, null: false
       t.string :description, null: false
       t.string :location, null: false
       t.integer :host_id, null: false
       t.timestamps(null:false)
    end
  end
end
