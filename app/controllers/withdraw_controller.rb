class WithdrawController < ApplicationController
  before_action :authenticate_user!

  def confirm
  end

  def update
    current_user.update(is_active: false)
    reset_session
    redirect_to root_path, notice: "退会処理が完了しました"
  end
end
