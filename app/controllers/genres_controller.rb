class GenresController < ApplicationController
  def ramen
    genre_shops = GenreShop.where(genre_id: 1).map{ |a| a.shop_id }
    @images = Image.where(shop_id: genre_shops, status: 1).map{ |b| b.image.to_s }
  end

  def sushi
    genre_shops = GenreShop.where(genre_id: 2).map{ |a| a.shop_id }
    @images = Image.where(shop_id: genre_shops, status: 1).map{ |b| b.image.to_s }
  end
end
