class ShopsController < ApplicationController
  def index
    @shops = Shop.includes(:image).limit(3)
  end

  def show
  end
end
