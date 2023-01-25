class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.integer :user_id, null: false
      t.integer :diary_id, null: false
      t.string :japanese_word, null: false
      t.string :english_word, null: false
      t.text :memo
      t.boolean :memorized_flag

      t.timestamps
    end
  end
end
