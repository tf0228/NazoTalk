class FavoritesController < ApplicationController
  def create
    question = Question.find(params[:question_id])
    favorites = current_user.favorites.new(question_id: question.id)
    favorites.save
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  def destroy
    question = Question.find(params[:question_id])
    favorite = current_user.favorites.find_by(question_id: question.id)
    favorite.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end
end
