class LikesController < ApplicationController
  before_action :like_find, only: [:create, :destroy]
  def create
    like = Like.create(user_id: current_user.id, shop_id: params[:shop_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, shop_id: params[:shop_id])
    like.destroy
  end

  private

  def like_find
    @shop = Shop.find(params[:shop_id])
  end
end
