class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :customer, foreign_key: true
      t.references :product, foreign_key: true
      t.string :title, null: false
      t.integer :rank, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
