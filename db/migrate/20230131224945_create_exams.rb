class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
