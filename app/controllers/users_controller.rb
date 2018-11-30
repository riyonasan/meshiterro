class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(1)
    @user_like = @user.user_shops.where(like: 'true')
    @liked_shop = Shop.where(id: @user_like)
    @liked_genre = @liked_shop.map(&:genres).flatten
    @rated_shop = Shop.where(id: @user.user_shops.where.not(rate: nil))
    rates = @user.user_shops.where.not(rate: nil).average(:rate)
    rates = rates.*10
    @rates = rates.round
    gon.labels = []
    gon.data = []
  end
end
