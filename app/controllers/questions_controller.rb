class QuestionsController < ApplicationController

  def index 
    @questions = Question.all
  end 
  
  # Used to show the form to create the resource
  def new
    @question = Question.new
  end

  # Used to create the resources, expect to recieve 
  # params submitted from the form in the new page
  def create
    question_params = params.require(:question).permit([:title, :body])
    @question = Question.new question_params
    if @question.save
      # redirect_to question_path(@question)
      redirect_to @question
    else
      # Show the form again with the error
      render :new
    end

  end

  def show
    @question = Question.find params[:id]
  end 
end
