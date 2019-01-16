class ShopsController < ApplicationController
  before_action :like_find, only: [:show]
  # after_action :like_update, only: :update

  def index
    @shops = Shop.includes(:images).limit(3)

    @rank_shops = Shop.includes(:images).order("shop_rate DESC").limit(3)

    # 以下あとで直す
    # @square_img_url = Image.square.first.image.to_s
    @shop_1 = Shop.find(1)
    @shop_2 = Shop.find(2)
    @shop_3 = Shop.find(3)
  end

  def show
    @rate = Rate.new

    genre_shop =  GenreShop.where(shop_id: @shop.id).first
    @genre = Genre.find(genre_shop.genre_id)

    @shop_ave = @shop.shop_rates_ave * 2
    @shop_rate = @shop.shop_rates_ave
  end

  private

  def like_find
    @shop = Shop.find(params[:id])
  end
end
