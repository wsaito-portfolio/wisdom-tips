class AddColumnTip < ActiveRecord::Migration[5.1]
  def change
    add_column :tips, :detail, :string
    add_column :tips, :refer_id, :integer
    add_index :tips,[:refer_id]
  end
end
