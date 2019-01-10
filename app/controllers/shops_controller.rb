class ShopsController < ApplicationController
  def index
    @shops = Shop.includes(:images).limit(3)
    # @square_img_url = Image.find_by(status: 1).image.to_s
    @shop_1 = Shop.find(1)
    @shop_2 = Shop.find(2)
    @shop_3 = Shop.find(3)
  end

  def show
    @shop = Shop.find(params[:id])
  end
end
