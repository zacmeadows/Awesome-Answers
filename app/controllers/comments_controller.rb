class CommentsController < ApplicationController

  def create
    @answer = Answer.find params[:answer_id]
    @comment = Comment.new comment_params
    @comment.answer = @answer
    @comment.save
    redirect_to question_path(@answer.question), notice: "Comment added"
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment.question, notice: "comment deleted!" }
      format.js   { render }
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
