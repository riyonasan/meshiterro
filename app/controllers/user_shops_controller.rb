class UserShopsController < ApplicationController
  def update
    @shop = Shop.find(params[:id])
    @user_shop = UserShop.find_by(user_id: current_user.id, shop_id: @shop.id)
    post_text = params[:data][:text]
    results = { :message => post_text }
    render partial: 'shops/user_shop', locals: { :results => results }
  end
end
