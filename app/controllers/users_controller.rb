class UsersController < ApplicationController
  def profile
    @user = current_user
  end

  def edit_profile
    current_user.update(profile_params)
    redirect_to users_setting_profile_path if current_user.save
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def profile_params
    params.require(:user).permit(:name, :sentence, :image)
  end
end
