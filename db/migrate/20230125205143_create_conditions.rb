class CreateConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :conditions do |t|
      t.string :name
      t.references :condition_group_id, null: false

      t.timestamps
    end
    add_reference :conditions, :condition_group, foreign_key: true
  end
end
