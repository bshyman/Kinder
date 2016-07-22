class AddDateToPlaydate < ActiveRecord::Migration[5.0]
  def change
    add_column :playdates, :date, :date
  end
end
