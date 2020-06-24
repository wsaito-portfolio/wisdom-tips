class AddTipsDeleteFlg < ActiveRecord::Migration[5.1]
  def change
    add_column :tips, :delete_flg, :integer
  end
end
