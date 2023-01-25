class AllDiariesController < ApplicationController
  def index
    @diaries = Diary.where.not(private_flag: true).order(created_at: "DESC")
  end
end
