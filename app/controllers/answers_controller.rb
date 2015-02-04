class AnswersController < ApplicationController
  before_action :find_question
  before_action :authenticate_user!
  # respond_to :js, :html


  def create
    @answer          = Answer.new answer_params
    @answer.question = @question
    @answer.user     = current_user
    respond_to do |format|
      if @answer.save
        AnswersMailer.notify_question_owner(@answer).deliver_later
        format.html { redirect_to @question, notice: "Answer created successfully!" }
        format.js   { render }
      else
        format.html { render "questions/show" }
        format.js   { render }
      end
    end
  end

  def destroy
    @answer   = current_user.answers.find params[:id]
    @answer.destroy
    respond_to do |format|
      format.js   { render }
      format.html { redirect_to question_path(@question), notice: "Answer deleted!" }
    # respond_with ()
    end
  end

  
  private 

  def answer_params
    params.require(:answer).permit(:body)
  end

  def find_question
    @question = Question.friendly.find params[:question_id]
  end 

end
