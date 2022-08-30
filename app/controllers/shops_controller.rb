class ShopsController < ApplicationController
  before_action :set_shop, only: %i[ show edit update destroy ]
  before_action :only_admin, except: %i[ index show ]

  def index
    @genres = Genre.all
    @q = Shop.includes(:genres, :favorites, :saved_shops).ransack(params[:q])
    @shops = @q.result(distinct: true).order(:id).page(params[:page])
  end

  def show
    if current_user
      add_browsing_histories
      delete_browsing_histories
    end
  end

  def new
    @shop = Shop.new
  end

  def edit
  end

  def create
    @shop = Shop.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to shop_url(@shop), notice: "ショップが登録されました。" }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to shop_url(@shop), notice: "ショップ情報が更新されました。" }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shop.destroy

    respond_to do |format|
      format.html { redirect_to shops_url, notice: "ショップ情報が削除されました。" }
      format.json { head :no_content }
    end
  end

  private
  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(
      :name, :prefecture, :city,
      :address, :latitude, :longitude,
      :business_hour, :cashless, :bike_rack,
      :remarks, { genre_ids: []})
  end

  def add_browsing_histories
      @browsing_history = BrowsingHistory.new
      @browsing_history.user_id = current_user.id
      @browsing_history.shop_id = @shop.id
      @browsing_history.save!
    end

  def delete_browsing_histories
    if current_user.browsing_histories.count > 4
      current_user.browsing_histories.first.destroy!
    end
  end
end
