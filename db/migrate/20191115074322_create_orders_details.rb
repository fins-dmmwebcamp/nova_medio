class CreateOrdersDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_details do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :price, null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
