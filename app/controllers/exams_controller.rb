class ExamsController < ApplicationController
  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(user: current_user)
    if @exam.save!
      @new_question = ExamQuestion.new(word_id: current_user.words.sample.id, exam_id: @exam.id)
      @new_question.save!
      redirect_to exam_question_path(id: @new_question.id)
    else
      render :new
    end
  end
end
