class AnswersController < ApplicationController
  before_action :find_question
  before_action :authenticate_user!

  def create
    # @question = Question.find params[:question_id]
    @answer = Answer.new answer_params # ----> Shortcut 
    @answer.question = @question
    @answer.user = current_user
    if @answer.save
      redirect_to @question, notice: "Answer created successfully"
    else
      render "questions/show" # ----> when you render you bring up an existing template and we won't lose the data we put in there
    end 
  end

  def destroy
    # @question = Question.find params[:question_id]
    @answer = current_user.answers.find params[:id]
    @answer.destroy
    redirect_to question_path(@question), notice: "Answer deleted"
  end 

  private 

  def answer_params
    params.require(:answer).permit(:body)
  end

  def find_question
    @question = Question.find params[:question_id]
  end 

end
