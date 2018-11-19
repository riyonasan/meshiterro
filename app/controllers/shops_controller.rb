class ShopsController < ApplicationController
  def index
    @shops = Shop.includes(:image).limit(3)
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
      @mastname = 'ようこそ'
      @mastname += @user.try(:nickname)  || '名無し'
      @mastname += 'さん'
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end
end
