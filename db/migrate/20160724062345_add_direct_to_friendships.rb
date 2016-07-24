class AddDirectToFriendships < ActiveRecord::Migration[5.0]
  def change
    add_column :friendships, :direct_add, :boolean, default: false
  end
end
