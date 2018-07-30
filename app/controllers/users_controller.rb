class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user = current_user
  end

  def show
  end

  def notifications
  end

  def friends
  end

  # private
  #
  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :birthday)
  # end
  #
  # def user
  #   @user ||= User.find(params[:id])
  # end
end
