class AddColumnToArtist < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :is_deleted, :boolean, default: false
  end
end
