class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :company, :email, :profile_image)
  end
end
