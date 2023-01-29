class WordsController < ApplicationController
  def index
    @words = Word.where(user_id: current_user.id).order(created_at: "DESC")
  end

  def show; end
  def new; end

  def edit; end
  def create; end

  def update; end

  def destroy; end
end
