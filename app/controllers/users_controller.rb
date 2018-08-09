class UsersController < ApplicationController
  before_action :authenticate_user! #possibly exclude friends to see friends of friends

  def index #show all user list to find friends that are not already friends or self
    @users = User.all
  end

  def show #show current_user timeline of all posts made by current_user and friends
    # find posts where user_id == current_user or current_user.friends limit 10 per page think about scroll down loading like FB
    @posts = Post.all
  end

  def notifications
    @notifications = current_user.notifications
  end

  def friends
    @friends = current_user.users_friends
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :birthday)
  end

  def user
    @user ||= User.find(params[:id])
  end
end
