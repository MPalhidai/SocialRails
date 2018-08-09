class FriendsController < ApplicationController

  def create
    @friend = Friend.create(friend_params)
    if @friend
      flash.now[:success] = "You have successfully made a friend request."
    else
      flash.now[:notice] = "Something went wrong sending your friend request."
    end
    redirect_to friend_requests_path
  end

  def destroy
    if friend.destroy
      flash[:success] = "You have deleted your friend request."
    else
      flash[:notice] = "Something went wrong deleting your friend request."
    end
    redirect_to friend_requests_path
  end

  def approve
    if friend.update_attribute(approve: true)
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
end
