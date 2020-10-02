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
  end

  def update
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
  end
end
