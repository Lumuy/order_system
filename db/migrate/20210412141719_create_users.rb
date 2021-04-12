class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :password_salt
      t.string :password_hash
      t.integer :role

      t.timestamps
    end
    add_index :users, :role
  end
end
