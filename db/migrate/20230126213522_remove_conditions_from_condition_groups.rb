class RemoveConditionsFromConditionGroups < ActiveRecord::Migration[7.0]
  def change
    remove_reference :condition_groups, :condition, null: false, foreign_key: true
  end
end
