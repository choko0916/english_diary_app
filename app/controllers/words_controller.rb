class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def show; end
  def new; end

  def edit; end
  def create; end

  def update; end

  def destroy; end
end
