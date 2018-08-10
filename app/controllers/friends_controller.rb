class FriendsController < ApplicationController

  def create
    if Friend.create(friend_params)
      flash[:success] = "You have successfully made a friend request."
    else
      flash[:notice] = "Something went wrong sending your friend request."
    end
    redirect_to request.referrer
  end

  def destroy
    if friend.destroy
      flash[:success] = "You have deleted your friend request."
    else
      flash[:notice] = "Something went wrong deleting your friend request."
    end
    redirect_to request.referrer
  end

  def approve
    friend.approve = true
    if @friend.save
      flash[:success] = "You are now friends!"
    else
      flash[:notice] = "Something went wrong approving your friend request."
    end
    redirect_to request.referrer
  end

  private

  def friend_params
    params.require(:friend).permit(:requesting_id, :requested_id)
  end

  def friend
    @friend ||= Friend.find(params[:id])
  end
end
