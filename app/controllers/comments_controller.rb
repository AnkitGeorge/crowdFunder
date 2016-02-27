class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to project_url(@comment.project), notice: 'Your comment has been posted.'
      #test to see what happens when @comment.project in brackets is removed.
    else
      redirect_to project_url(@comment.project), notice: 'Your comment was not saved. Please try again.'
    end

  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.present?
      @comment.destroy
    end

    redirect_to projects_url, notice: 'Your comment has been deleted.'
  end

  private
  def comment_params
    params.require(:comment).permit(:body_text, :user_id, :comment_id)
  end

end
