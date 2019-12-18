class AddColumnToGenre < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :is_deleted, :boolean, default: false
  end
end
