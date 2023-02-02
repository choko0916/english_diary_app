class ExamsController < ApplicationController
  def new
    @exam = Exam.new
  end

  def create
    exam = Exam.new(user: current_user)
    exam.save!
  end
end
