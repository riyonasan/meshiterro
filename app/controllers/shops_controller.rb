class ShopsController < ApplicationController
  before_action :like_find, only: [:show]
  # after_action :like_update, only: :update

  def index
    @shops = Shop.includes(:images).limit(3)
    @rank_shops = Shop.includes(:images).order("shop_rate DESC").limit(3)
    @ramen_shop = Shop.find(2)
  end

  def show
    genre_shop =  GenreShop.where(shop_id: @shop.id).first
    @genre = Genre.find(genre_shop.genre_id)

    @rate = Rate.new
    @shop_ave = @shop.shop_rate * 2
    @shop_rate = @shop.shop_rate
  end

  private

  def like_find
    @shop = Shop.find(params[:id])
  end
end
