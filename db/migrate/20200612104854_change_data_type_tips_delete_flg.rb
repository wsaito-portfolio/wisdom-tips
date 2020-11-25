class ChangeDataTypeTipsDeleteFlg < ActiveRecord::Migration[5.1]
  def change
    change_column :tips, :delete_flg, 'boolean USING CAST(delete_flg AS boolean)' , default: false, null: false
  end
end
