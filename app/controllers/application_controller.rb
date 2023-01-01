class ApplicationController < ActionController::Base
  private

  def sign_in_required
    redirect_to new_user_session_path unless user_signed_in?
  end
end
