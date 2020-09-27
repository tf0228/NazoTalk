class RatingsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @rating = current_user.ratings.new(rating_params)
    @rating.question_id = @question.id
    if @rating.save
      redirect_to question_path(@question)
    else
      render 'questions/show'
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.update(rating_params)
    redirect_to question_path(params[:question_id])
  end

  def destroy
    Rating.find_by(id: params[:id], question_id: params[:question_id]).destroy
    redirect_to question_path(params[:question_id])
  end

  private

    def rating_params
      params.require(:rating).permit(:user_id, :question_id, :value, :comment)
    end
end
