class UsersController < ApplicationController
  def index
    if params.has_key?(:search)
      @users = User.where("name LIKE ?", "%#{params[:search][:name]}%").page(params[:page]).per(20)
      @search_name = params[:search][:name]
    else
      @users = User.where(is_active: true).page(params[:page]).per(20)
    end
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
    @users = @user.following.all.page(params[:page]).per(20)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.all.page(params[:page]).per(20)
  end

  def questions
    @user = User.find(params[:id])
    @questions = @user.questions.page(params[:page]).per(20)
  end

  def favorites
    @user = User.find(params[:id])
    @questions = @user.favorite_questions.order(:created_at).page(params[:page]).per(20)
  end

  def messages
    @user = User.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(host_id: @user.id).page(params[:page]).per(20)
  end

  private

    def user_params
      params.require(:user).permit(:image, :name, :email, :profile)
    end

end
