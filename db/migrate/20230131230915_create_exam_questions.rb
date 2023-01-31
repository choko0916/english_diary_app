class CreateExamQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :exam_questions do |t|
      t.integer :exam_id, null: false
      t.integer :word_id, null: false
      t.boolean :is_correct, null: false

      t.timestamps
    end
  end
end
