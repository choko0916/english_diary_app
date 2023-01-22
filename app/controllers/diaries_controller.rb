class DiariesController < ApplicationController
  before_action :authenticate_user!
  def index; end

  def show; end

  def new
    @diary = Diary.new
  end

  def edit; end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to diaries_path, notice: t(".diary_new_notice")
    else
      render new_diary_path, alert: t(".diary_new_alert")
    end
  end

  def update; end

  def destroy; end

  private

  def diary_params
    params.require(:diary).permit(:id, :user_id, :japanese_diary, :english_diary, :photo, :private_flag)
  end
end
