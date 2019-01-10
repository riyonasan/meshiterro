class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @user_like = @user.user_shops.where(like: 'true')
    @liked_shop = Shop.where(id: @user_like)
    @liked_genre = @liked_shop.map(&:genres).flatten
    @rated_shop = Shop.where(id: @user.user_shops.where.not(rate: nil))
    rates = 0
    unless rates == 0
      rates = @user.user_shops.where.not(rate: nil).average(:rate)
      rates = rates.*10
      @rates = rates.round
    end
    gon.labels = []
    gon.data = []
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path
      flash[:success] = "プロフィールを更新しました"
    else
      render 'edit'
    end
  end
  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
