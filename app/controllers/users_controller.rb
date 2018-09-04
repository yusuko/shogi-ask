class UsersController < ApplicationController
  def profile
    @user = current_user
  end

  def edit_profile
    current_user.update(profile_params)
    redirect_after_update_profile
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def profile_params
    params.require(:user).permit(:name, :sentence, :image)
  end

  def redirect_after_update_profile
    if current_user.save
      flash[:success]="プロフィールが更新されました。"
      redirect_to current_user
    else
      flash[:danger]="プロフィールが正しく更新されませんでした。"
      redirect_to current_user
    end
  end
end
