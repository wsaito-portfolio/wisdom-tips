class AddColumnTipParentId < ActiveRecord::Migration[5.1]
  def change
    add_column :tips, :parent_id, :integer
  end
end
