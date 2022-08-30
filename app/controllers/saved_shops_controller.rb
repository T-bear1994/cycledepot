class SavedShopsController < ApplicationController
  before_action :set_shop

  def create
    @saved_shop = current_user.saved_shops.new(shop_id: @shop.id)
    @saved_shop.save
  end

  def destroy
    @saved_shop = current_user.saved_shops.find_by(shop_id: @shop.id)
    @saved_shop.destroy
  end

  private

  def saved_shop_params
    params.require(:saved_shop).permit(:shop_id)
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end
