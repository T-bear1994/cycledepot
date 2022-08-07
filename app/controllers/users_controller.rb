class UsersController < ApplicationController
  before_action :only_admin, only: %i[ index show ]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
