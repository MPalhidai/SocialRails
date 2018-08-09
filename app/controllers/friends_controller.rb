class FriendsController < ApplicationController
  before_action :authenticate_user!, exclude: [:create]
  # before_action :authenticate_friend_requestor, exclude: [:create]
  # think about an index to show all friend requests

  def create
    @friend = Friend.create(friend_params)
    if @friend
      flash[:success] = "You have successfully made a friend request."
    else
      flash[:notice] = "Something went wrong sending your friend request."
    end
  end

  def destroy
    if friend.destroy
      flash[:success] = "You have deleted your friend request."
    else
      flash[:notice] = "Something went wrong deleting your friend request."
    end
    redirect_to users_path
  end

  def approve
    friend.approve = true
    if @friend.save
      flash[:success] = "You are now friends!"
    else
      flash[:notice] = "Something went wrong approving your friend request."
    end
    redirect_to notifications_path
  end

  private

  def friend_params
    params.require(:friend).permit(:requesting_id, :requested_id)
  end

  def friend
    @friend ||= Friend.find(params[:id])
  end

  def authenticate_friend_requestor
    unless Friend.find(params[:id]).requesting_id == current_user.id
      flash[:notice] = 'You can not edit this friendship'
    end
  end
end
