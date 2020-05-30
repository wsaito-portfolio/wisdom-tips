class CreateTips < ActiveRecord::Migration[5.1]
  def change
    create_table :tips do |t|
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
     add_index :tips,[:user_id,:created_at]
  end
end
