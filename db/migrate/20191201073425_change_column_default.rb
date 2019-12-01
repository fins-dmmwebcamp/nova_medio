class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:products, :is_deleted, false)
  end
end
