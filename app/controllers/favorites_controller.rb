class FavoritesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    favorites = current_user.favorites.new(question_id: @question.id)
    favorites.save
  end

  def destroy
    @question = Question.find(params[:question_id])
    favorite = current_user.favorites.find_by(question_id: @question.id)
    favorite.destroy
  end
end
