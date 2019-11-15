class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.references :product, foreign_key: true
      t.integer :order, null: false

      t.timestamps
    end
  end
end
