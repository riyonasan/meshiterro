class RatesController < ApplicationController
  before_action :rate_params, only: [:create, :update]

  def create
    @rate = Rate.create(rate_params)
    shop = Shop.find(params[:shop_id])
    # logger.debug @rate.errors.inspect
    redirect_to shop_path(shop)
  end

  # def update
  # end

  private

  def rate_params
    params.require(:rate).permit(:rate).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end

end
