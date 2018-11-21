class UsersController < ApplicationController
  def show
    @user = User.find(1)
    @user_like = @user.user_shops.where(like: 'true')
    @liked_shop = Shop.where(id: @user_like)

    gon.labels = []
    gon.data = []
  end
end
