class RatesController < ApplicationController
  before_action :authenticate_user!

  def update
    shop = Shop.find(params[:shop_id])
    rate = Rate.find_by(user_id: current_user.id, shop_id: shop.id)
    rate.update(rate_params)
    # logger.debug @rate.errors.inspect
    redirect_to shop_path(shop)
  end

  private

  def rate_params
    params.require(:rate).permit(:rate)
  end

end
