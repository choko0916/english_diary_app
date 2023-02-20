class WordsController < ApplicationController
  def index
    @words = Word.where(user_id: current_user.id).order(created_at: "DESC")
  end
end
