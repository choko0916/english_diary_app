class ExamQuestionsController < ApplicationController
  def show
    @exam_question = ExamQuestion.find(params[:id])
  end
end
