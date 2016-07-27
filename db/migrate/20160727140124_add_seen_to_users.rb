class AddSeenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :seen, :boolean, default: false
  end
end
