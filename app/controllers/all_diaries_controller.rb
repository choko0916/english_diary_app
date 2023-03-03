class AllDiariesController < ApplicationController
  def index
    @diaries = Diary.includes(:user).where.not(private_flag: true).order(created_at: "DESC")
  end
end
