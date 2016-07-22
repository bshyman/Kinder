class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
<<<<<<< HEAD
      t.string :username
      t.string :password_digest
      t.integer :zipcode
=======
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
>>>>>>> cd40b6bcd10cd1ebe9e615eacdf8615a9ab62c74
      t.timestamps(null:false)
    end
  end
end
