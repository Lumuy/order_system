class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :amount
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :orders, :status
  end
end
