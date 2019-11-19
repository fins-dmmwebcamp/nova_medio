class ChangeColumnNull < ActiveRecord::Migration[5.2]
  def change

  	def up
    # Not Null制約を外す(NULLがOK)
    change_column_null :destinations, :created_at, true
    
  end

  end
end
