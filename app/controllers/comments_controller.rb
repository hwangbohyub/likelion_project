class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:destroy]
  before_action :is_owner?, only: [:destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.save

    redirect_to post_path(params[:post_id])
  end

  def destroy
    @comment.destroy!
    redirect_to post_path(params[:post_id])
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id)
  end

  def is_owner?
    unless current_user == @comment.user
      redirect_to root_path
    end
  end
end
