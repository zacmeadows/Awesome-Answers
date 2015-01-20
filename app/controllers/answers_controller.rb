class AnswersController < ApplicationController
  
  def create
    @question = Question.find params[:question_id]
    @answer = @question.answers.new answer_params
    @answer.save
    redirect_to @question, notice: "Answer created successfully"
  end

  private 

  def answer_params
    params.require(:answer).permit(:body)
  end

end
