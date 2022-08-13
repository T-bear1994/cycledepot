class ShopsController < ApplicationController
  before_action :set_shop, only: %i[ show edit update destroy ]
  before_action :only_admin, except: %i[ index show ]

  # GET /shops or /shops.json
  def index
    @genres = Genre.all
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)
  end

  # GET /shops/1 or /shops/1.json
  def show
    if current_user
      add_browsing_histories
      delete_browsing_histories
    end
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops or /shops.json
  def create
    @shop = Shop.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to shop_url(@shop), notice: "Shop was successfully created." }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1 or /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to shop_url(@shop), notice: "Shop was successfully updated." }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1 or /shops/1.json
  def destroy
    @shop.destroy

    respond_to do |format|
      format.html { redirect_to shops_url, notice: "Shop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shop_params
      params.require(:shop).permit(:name, :prefecture, :city, :address, :latitude, :longitude, :business_hour, :cashless, :bike_rack, :remarks)
    end

    def add_browsing_histories
      @browsing_history = BrowsingHistory.new
      @browsing_history.user_id = current_user.id
      @browsing_history.shop_id = @shop.id
      @browsing_history.save!
    end

    def delete_browsing_histories
      if current_user.browsing_histories.count > 3
        current_user.browsing_histories.first.destroy!
      end
    end
end
