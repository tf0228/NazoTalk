class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @ratings = Rating.where(question_id: @question.id)
    @rating = Rating.new
    if current_user
      @edit_rating = Rating.find_by(user_id: current_user.id, question_id: @question.id)
    end
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
      params.require(:question).permit(:number, :user_id, :sentence, :image, :hint_1, :hint_2, :hint_3,
                                        :answer, :commentary, :answer_image, :average_rating)
    end
end
