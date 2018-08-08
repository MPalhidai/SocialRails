class LikesController < ApplicationController

  #think about a page to show current_users likes

  def create
    @like = current_user.likes.build(like_params)
    if @like.save
      flash[:notice] = "You liked a #{@like.liked_type}"
    else
      flash[:notice] = "Something went wrong."
    end
    redirect_to request.referrer
  end

  def destroy
    @like = Like.find(params[:id]).destroy
    flash[:notice] = "Something went wrong." unless @like.save
    redirect_to request.referrer
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :liked_id, :liked_type)
  end
end
