class LikesController < ApplicationController
  before_action :authenticate_user!

  # 
  def create
    @question = Question.find params[:question_id]
    @like = @question.likes.new 
    @like.user = current_user # current_user comes with 'devise' gem
    if @like.save
      redirect_to @question, notice: "liked!"
    else
      redirect_to @question, alert: "Liked Already!"
    end 
  end 

  def destroy
    question = Question.find params[:question_id]
    like = question.likes.find params[:id]
    if like.destroy
      redirect_to question, notice: "Unliked!"
    else 
      redirect_to question, alert: "Can't Unlike"
    end 
  end 

end
