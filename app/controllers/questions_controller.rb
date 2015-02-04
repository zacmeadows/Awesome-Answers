class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:index, :show]
  before_action :restrict_access, only: [:destroy]

  def index 
    @questions = Question.order(:id)
  end 
  
  # Used to show the form to create the resource
  def new
    @question = Question.new
    render :new
  end

  # Used to create the resources, expect to recieve 
  # params submitted from the form in the new page
  def create
    # question_params = params.require(:question).permit([:title, :body])
    @question = Question.new question_params
    @question.user = current_user
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
    # @question.view_count += 1
    # @question.save
    @question.increment!(:view_count)
    @answer = Answer.new
    @answers = @question.answers
    respond_to do |format|
      format.html { render }
      format.json {render json: @question.to_json }
      format.text {render text: @question.title }
      format.xml {render xml: @question.to_xml }
    end
  end

  def edit 
    unless can? :edit, @question
      redirect_to root_path, alert: "Access Denied" unless can? :edit
    end 
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
  # @question = current_user.projects.find params[:id] 
    @question.destroy 
    redirect_to questions_path, notice: "Question deleted"
  end


  private

  def find_question
    @question = Question.friendly.find params[:id]
  end

  def question_params
    question_params = params.require(:question).permit(:title, :body, {category_ids: []},
                                                                      {collaborator_ids: []})
  end 

  def restrict_access
    unless can? :manage, @question
      redirect_to root_path, alert: "access denied"
    end 
  end 

end




