class AddMaritalStatusToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :marital_status, :string
  end
end
