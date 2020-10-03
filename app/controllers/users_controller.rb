class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      @title = "#{@user.name}さんのマイページ"
    else
      @title = "#{@user.name}さんのページ"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザ情報を編集しました"
    else
      render :edit
    end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.all
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.all
  end

  def questions
    @user = User.find(params[:id])
    @questions = @user.questions
  end

  def favorites
    @user = User.find(params[:id])
    @questions = @user.favorite_questions.order(:created_at)
  end

  def messages
    @user = User.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(host_id: @user.id)
  end

  def user_params
    params.require(:user).permit(:image, :name, :email, :profile)
  end
end
