class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :artist, foreign_key: true
      t.references :label, foreign_key: true
      t.references :genre, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :stock, null: false, default: 0
      t.integer :sales, null: false, default: 0
      t.date :released_at, null: false
      t.boolean :on_sale, null: false, default: true
      t.boolean :is_deleted, null: false, default: true
      t.string :product_image_id

      t.timestamps
    end
  end
end
