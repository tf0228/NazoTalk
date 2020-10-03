class CommentsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    comment = Comment.new(comment_params)
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Comment.find_by(id: params[:id], host_id: params[:user_id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

    def comment_params
      params.require(:comment).permit(:host_id, :client_id, :text)
    end
end
