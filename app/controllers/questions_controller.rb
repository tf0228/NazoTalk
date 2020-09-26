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
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question), notice: "問題を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to mypage_questions_path
  end

  private

    def question_params
      params.require(:question).permit(:id, :user_id, :sentence, :image, :hint_1, :hint_2, :hint_3,
                                        :answer, :commentary, :answer_image, :average_rating,
                                        :remove_image, :remove_answer_image)
    end
end
