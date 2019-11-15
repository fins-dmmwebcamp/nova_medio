class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.integer :shipping_status, null: false
      t.integer :payment, null: false
      t.integer :shipping_fee, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :reciever, null: false

      t.timestamps
    end
  end
end
