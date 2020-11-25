class ChangeDataTipsToDetail < ActiveRecord::Migration[5.1]
  def change
      change_column :tips, :detail,'text USING CAST(detail AS text)'
  end
end
