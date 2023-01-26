class RemoveConditionGroupFromConditions < ActiveRecord::Migration[7.0]
  def change
    remove_reference :conditions, :condition_group, null: false, foreign_key: true
  end
end
