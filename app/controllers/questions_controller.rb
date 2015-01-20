class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  def index 
    @questions = Question.order(:id)
  end 
  
  # Used to show the form to create the resource
  def new
    @question = Question.new
  end

  # Used to create the resources, expect to recieve 
  # params submitted from the form in the new page
  def create
    # question_params = params.require(:question).permit([:title, :body])
    @question = Question.new question_params
    if @question.save
      # redirect_to question_path(@question)
      # flash[:notice] = "Question created succesfully!"
      redirect_to @question, notice: "Question created successfully!"
    else
      # Show the form again with the error
      render :new
    end

  end

  def show
    @question.increment!(:view_count)
    @answer = Answer.new
    @answers = @question.answers
    
    # @question.view_count += 1
    # @question.save

    # @question.increment(view_count, by = 1)
    # @question.save
  end

  def edit 
  end 

  def update
    #question_params = params.require(:question).permit(:title, :body)
    if @question.update question_params
      redirect_to @question, notice: "Question updated successfully"
    else
      render :edit
    end 
  end 

  def destroy # No need for @ sign 
    @question.destroy 
    redirect_to questions_path, notice: "Question deleted"
  end


  private

  def find_question
    @question = Question.find params[:id]
  end

  def question_params
    question_params = params.require(:question).permit(:title, :body)
  end 

end



















