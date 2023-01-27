class RenameConditionsIdColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :conditions, :condition_id, :condition_group_id
  end
end
