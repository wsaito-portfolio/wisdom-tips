class CreateReasons < ActiveRecord::Migration[5.1]
  def change
    create_table :reasons do |t|
      t.string :content
      t.references :tip, foreign_key: true

      t.timestamps
    end
    add_index :reasons,[:tip_id,:created_at]
  end
end
