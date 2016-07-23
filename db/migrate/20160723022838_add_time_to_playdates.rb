class AddTimeToPlaydates < ActiveRecord::Migration[5.0]
  def change
    add_column :playdates, :time, :time
  end
end
