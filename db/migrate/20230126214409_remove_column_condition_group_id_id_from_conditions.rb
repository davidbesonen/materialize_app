class RemoveColumnConditionGroupIdIdFromConditions < ActiveRecord::Migration[7.0]
  def change
    remove_index :conditions, :condition_group_id_id
    remove_column :conditions, :condition_group_id_id, :string
  end
end
