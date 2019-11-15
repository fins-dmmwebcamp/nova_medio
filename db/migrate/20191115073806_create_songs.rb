class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.references :disc, foreign_key: true
      t.integer :order, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
