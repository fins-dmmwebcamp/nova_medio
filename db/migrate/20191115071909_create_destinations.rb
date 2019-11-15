class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.references :customer, foreign_key: true
      t.string :name, null: false
      t.string :postal_code, null: false
      t.integer :address_prefecture, null: false
      t.string :address_city, null: false
      t.string :address_after, null: false
      t.boolean :is_main, null: false, default: false

      t.timestamps
    end
  end
end
