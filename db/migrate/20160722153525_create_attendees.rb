class CreateAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|
      t.integer :guest_id
      t.integer :playdate_id
      t.boolean :response
    end
  end
end
