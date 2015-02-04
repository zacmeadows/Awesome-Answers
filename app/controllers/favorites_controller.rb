class FavoritesController < ApplicationController

  # you only need instance variables if you are rendering a page, or you have a 'before action'
  def create 
    @question = Question.friendly.find params[:question_id]
    @favorite = @question.favorites.new
    @favorite.user = current_user
    @favorite.save
    redirect_to @question, notice: "Favorited!"
  end 


   def destroy
    question = Question.friendly.find params[:question_id]
    favorite = question.favorites.find params[:id]
    if favorite.destroy
      redirect_to question, notice: "Unfavorited!"
    else 
      redirect_to question, alert: "Can't Unfavorite"
    end 
  end 

end
