class RatingsController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]

  def create
    @question = Question.find(params[:question_id])
    @rating = current_user.ratings.new(rating_params)
    @rating.question_id = @question.id
    if @rating.save
      redirect_to question_path(@question)
    else
      redirect_to question_path(@question), alert: "評価が空欄のため、評価・コメントできませんでした。"
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update(rating_params)
      redirect_to question_path(params[:question_id])
    else
      redirect_to question_path(params[:question_id]), alert: "評価が空欄のため、評価・コメントを編集できませんでした。"
    end
  end

  def destroy
    Rating.find_by(id: params[:id], question_id: params[:question_id]).destroy
    redirect_to question_path(params[:question_id])
  end

  private

    def rating_params
      params.require(:rating).permit(:user_id, :question_id, :value, :comment)
    end

    def correct_user
      @rating = current_user.ratings.find_by(id: params[:id])
      redirect_to root_path unless @rating
    end
end
