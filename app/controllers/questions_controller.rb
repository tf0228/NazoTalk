class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def question_params
      params.require(:question).permit(:id, :user_id, :sentence, :image, :hint_1, :hint_2, :hint_3,
                                        :answer, :commentary, :answer_image, :average_rating)
    end
end
