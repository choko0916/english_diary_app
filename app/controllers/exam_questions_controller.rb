class ExamQuestionsController < ApplicationController
  def show
    @exam_question = ExamQuestion.find(params[:id])
  end

  def update
    @exam_question = ExamQuestion.find(params[:id])
    @exam_question.update!(is_correct: @exam_question.word.english_word == params[:exam_question][:english_word])
    @exam = Exam.find(@exam_question.exam_id)
    if @exam.exam_questions.size == 10
      redirect_to new_exam_path
    else
      @new_question = ExamQuestion.create!(word_id: current_user.words.sample.id, exam_id: @exam.id)
      redirect_to exam_question_path(id: @new_question.id)
    end
  end
end
