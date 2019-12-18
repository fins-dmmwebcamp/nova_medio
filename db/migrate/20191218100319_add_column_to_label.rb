class AddColumnToLabel < ActiveRecord::Migration[5.2]
  def change
    add_column :labels, :is_deleted, :boolean, default: false
  end
end
