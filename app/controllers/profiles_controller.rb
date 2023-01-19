class ProfilesController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    current_user.avatar.attach(params[:user][:avatar]) if current_user.avatar.blank?
    if current_user.update(user_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to homes_show_path
    else
      flash[:notice] = "プロフィールの更新に失敗しました"
      edit_profiles_path
    end
  end
end

private

def user_params
  params.require(:user).permit(:avatar, :username, :bio)
end
