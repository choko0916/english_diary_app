class ProfilesController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    if current_user.email == "guest@example.com"
      return redirect_to root_path, alert: t(".update_alert")
    end

    if current_user.update(user_params)
      redirect_to homes_show_path, notice: t(".profile_update_notice")
    else
      render edit_profiles_path, alert: t(".profile_update_alert")
    end
  end
end

private

def user_params
  params.require(:user).permit(:avatar, :username, :bio)
end
