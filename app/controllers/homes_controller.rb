class HomesController < ApplicationController
  before_action :sign_in_required, only: [:show]
  def index; end

  def show
    @posted_days = Diary.where(user_id: current_user.id)
    @number_of_words = Word.where(user_id: current_user.id)
  end
end
