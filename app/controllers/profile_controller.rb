class ProfileController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def recreate_api_token
    @user.update(api_token: SecureRandom.uuid)
    redirect_to my_profile_path
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
