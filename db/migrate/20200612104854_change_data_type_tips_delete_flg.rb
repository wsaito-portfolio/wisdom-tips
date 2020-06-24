class ChangeDataTypeTipsDeleteFlg < ActiveRecord::Migration[5.1]
  def change
    change_column :tips, :delete_flg, :boolean, default: false, null: false
  end
end
