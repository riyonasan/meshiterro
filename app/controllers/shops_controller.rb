class ShopsController < ApplicationController
  before_action :like_find, only: [:show, :update]
  after_action :like_update, only: :update
  def index
    @shops = Shop.includes(:images).limit(3)
    @square_img_url = Image.find_by(status: 1).image.to_s
    @shop_1 = Shop.find(1)
    @shop_2 = Shop.find(2)
    @shop_3 = Shop.find(3)
    # きもい
  end

  def show
    if @user_shop.nil?
      @user_shop = UserShop.create(user_id: current_user.id, shop_id: @shop.id, like: 0)
    end
  end

  def update
    render json: @user_shop.like
  end

  private

  def like_find
    @shop = Shop.find(params[:id])
    if user_signed_in?
      @user_shop = UserShop.find_by(user_id: current_user.id, shop_id: @shop.id)
    end
  end

  def like_update
    if @user_shop.like == false
      @user_shop.update(like: true)
    elsif @user_shop.like == true
      @user_shop.update(like: false)
    end
  end
end
