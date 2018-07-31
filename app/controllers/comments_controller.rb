class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "You have successfully made a comment."
      redirect_to user_path
    else
      flash[:notice] = "Something went wrong posting your comment."
      render :new
    end
  end

  def destroy
    comment.destroy
    flash[:success] = "You have successfully removed your comment."
    redirect_to user_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :post_id)
  end

  def comment #keep for edit
    @comment ||= Comment.find(params[:id])
  end
end
