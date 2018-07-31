class LikesController < ApplicationController

  #think about a page to show current_users likes

  def create
    @like = current_user.likes.build(like_params)
    flash[:notice] = "Something went wrong." unless @like.save
    redirect_to :back
  end

  def destroy
    @like = Like.find(params[:id]).destroy
    flash[:notice] = "Something went wrong." unless @like.save
    redirect_to :back
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :liked, :liked_type)
  end
end
