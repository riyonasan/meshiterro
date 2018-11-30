class ShopsController < ApplicationController
  def index
    @shops = Shop.includes(:images).limit(3)
    @square_img_url = Image.find_by(status: 1).image.to_s
    @shop_1 = Shop.find(1)
    @shop_2 = Shop.find(2)
    @shop_3 = Shop.find(3)
    # きもい
  end

  def show
    @shop = Shop.find(params[:id])

    if user_signed_in?
      @user_shop = UserShop.find_by(user_id: current_user.id, shop_id: @shop.id)
      if @user_shop.nil?
        @user_shop = UserShop.create(user_id: current_user.id, shop_id: @shop.id, like: 0)
      end
    end
  end

  def update
    @shop = Shop.find(params[:id])
    if user_signed_in?
      @user_shop = UserShop.find_by(user_id: current_user.id, shop_id: @shop.id)
    end
    render json: @user_shop.like
    # きもい

    if @user_shop.like = false
      @user_shop.update_attribute(like: true)
    elsif @user_shop.like = true
      @user_shop.update_attribute(like: false)
    end
  end

end
