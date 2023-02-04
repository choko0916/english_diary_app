class ExamQuestionsController < ApplicationController
  def show
    @exam_question = ExamQuestion.find(params[:id])
  end

  def update
    @exam_question = ExamQuestion.find(params[:id])
    @exam_question.update!(is_correct: @exam_question.word.english_word == params[:english_word])
    @exam = Exam.find(@exam_question.exam_id)
    @new_question = ExamQuestion.create!(word_id: current_user.words.sample.id, exam_id: @exam.id)
    redirect_to exam_question_path(id: @new_question.id)
  end
end
