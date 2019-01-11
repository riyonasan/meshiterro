class LikesController < ApplicationController
  def create
    like = Like.create(user_id: current_user.id, shop_id: params[:shop_id])
    @shop = like.shop
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, shop_id: params[:shop_id])
    like.destroy
  end

  private

end
