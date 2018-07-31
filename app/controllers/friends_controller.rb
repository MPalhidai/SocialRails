class FriendsController < ApplicationController
  before_action :authenticate_user!, exclude: [:create]
  # before_action :authenticate_friend_requestor, exclude: [:create]
  # think about an index to show all friend requests

  def create
    @friend = current_user.friends.build(friend_params)
    if @friend.save
      flash[:success] = "You have successfully made a friend request."
      redirect_to users_friends_path
    else
      flash[:notice] = "Something went wrong sending your friend request."
      redirect_to users_path
    end
  end

  def destroy
    friend.destroy
    if @friend.save
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

  def friend #keep for edit
    @friend ||= Friend.find(params[:id])
  end

  def authenticate_friend_requestor
    unless Friend.find(params[:id]).requesting_id == current_user.id
      flash[:notice] = 'You can not edit this friendship'
    end
  end
end
