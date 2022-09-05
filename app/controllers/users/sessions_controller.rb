class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  end

  def new_admin
    user = User.admin
    sign_in user
    redirect_to root_path, notice: "アドミンユーザーとしてログインしました。"
  end
end