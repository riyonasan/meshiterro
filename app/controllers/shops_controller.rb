class ShopsController < ApplicationController
  def index
    @shops = Shop.includes(:image).limit(3)
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
      @mastname = 'ようこそ'
      @mastname += @user.try(:nickname)  || '名無し'
      @mastname += 'さん'
    end
    @shop_1 = Shop.find(1)
    @shop_2 = Shop.find(2)
    @shop_3 = Shop.find(3)
  end

  def show
    @shop = Shop.find(params[:id])
  end
end
