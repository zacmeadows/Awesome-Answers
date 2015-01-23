class CommentsController < ApplicationController

  def create
    @answer = Answer.find params[:answer_id]
    @comment = Comment.new comment_params
    @comment.answer = @answer
    @comment.save
    redirect_to @answer.question, notice: "Comment added"
  end 

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to @comment.question, notice: "Comment deleted"
  end

  private 

  def comment_params
    params.require(:comment).permit(:body)
  end

end
