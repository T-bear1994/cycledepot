class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :only_admin, only: %i[ index ]
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :only_your_own, only: %i[ show ]

  def index
    @users = User.all.page(params[:page])
  end

  def show
    @saved_shops = @user.shops.page(params[:page])
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
      format.html { redirect_to users_url, notive: "アカウントを削除しました。" }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def only_your_own
    redirect_to root_path unless User.find(params[:id]) == current_user
  end
end
