class AddConditionIdToConditions < ActiveRecord::Migration[7.0]
  def change
    add_column :conditions, :condition_id, :integer
    add_index :conditions, :condition_id
  end
end
