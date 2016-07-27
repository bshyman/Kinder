class AddGoogleLoginColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :token, :string
    add_column :users, :refresh_token, :string
    add_column :users, :expires_in, :integer
  end
end
