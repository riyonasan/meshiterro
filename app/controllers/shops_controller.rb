class ShopsController < ApplicationController
  before_action :like_find, only: [:show, :update]
  after_action :like_update, only: :update
  def index
    @shops = Shop.includes(:images).limit(3)
    @rank_shops = Shop.includes(:images).limit(3)

    # 以下あとで直す
    @square_img_url = Image.square.first.image.to_s
    @shop_1 = Shop.find(1)
    @shop_2 = Shop.find(2)
    @shop_3 = Shop.find(3)
  end

  def show
    # いいね機能
    if user_signed_in?
      @user_shop = UserShop.find_by(user_id: current_user.id, shop_id: @shop.id)
      if @user_shop.nil?
        @user_shop = UserShop.create(user_id: current_user.id, shop_id: @shop.id, like: 0)
      end
    end

    genre_shop =  GenreShop.where(shop_id: @shop.id).first
    @genre = Genre.find(genre_shop.genre_id)
  end

  def update
    render json: @user_shop.like
  end

  private

  def like_find
    @shop = Shop.find(params[:id])
  end

  def like_update
    if @user_shop.like == false
      @user_shop.update(like: true)
    elsif @user_shop.like == true
      @user_shop.update(like: false)
    end
  end
end
