class AllDiariesController < ApplicationController
  def index
    @diaries = Diary.where.not(private_flag: true)
  end
end
