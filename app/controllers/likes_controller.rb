class LikesController < ApplicationController
  before_action :like_find, only: [:create, :destroy]
  def create
    if like.nul?
      like = Like.create(user_id: current_user.id, shop_id: @shop.id)
    end

  end

  def destroy
  end

  private

  def like_find
    @shop = Shop.find(params[:id])
    like = Like.find_by(user_id: current_user.id, shop_id: @shop.id)
  end
end
