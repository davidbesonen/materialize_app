class CreateConditionGroups < ActiveRecord::Migration[7.0]
  def change
    drop_table :condition_groups
    create_table :condition_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
