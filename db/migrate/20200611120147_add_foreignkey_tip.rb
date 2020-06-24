class AddForeignkeyTip < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :tips, :tips, column: :refer_id
  end
end
