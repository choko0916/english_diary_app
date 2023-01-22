class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.integer :user_id, null: false
      t.text :japanese_diary
      t.text :english_diary, null: false
      t.string :photo
      t.boolean :private_flag

      t.timestamps
    end
  end
end
