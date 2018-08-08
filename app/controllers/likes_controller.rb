class LikesController < ApplicationController

  #think about a page to show current_users likes

  def create
    @like = current_user.likes.build(like_params)
    if @like.save
      flash[:success] = "You liked #{@like.user.first_name}'s #{@like.liked_type.downcase}"
    else
      flash[:notice] = "Something went wrong."
    end
    redirect_to request.referrer
  end

  def destroy
    if like.destroy
      flash[:success] = "You unliked #{@like.user.first_name}'s #{@like.liked_type.downcase}"
    else
      flash[:notice] = "Something went wrong."
    end
    redirect_to request.referrer
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :liked_id, :liked_type)
  end

  def like
    @like ||= Like.find(params[:id])
  end
end
