class AddColumnTipChildId < ActiveRecord::Migration[5.1]
  def change
    add_column :tips, :child_id, :integer
  end
end
