class UsersController < ApplicationController
  before_action :only_admin, only: %i[ index ]
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "ユーザー情報が更新されました。"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notive: "ユーザーが削除されました" }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
