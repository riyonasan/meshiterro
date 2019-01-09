class GenresController < ApplicationController
  def ramen
    genre_shops = GenreShop.with_genres(1).map(&:shop_id)
    @images = Image.where(shop_id: genre_shops).square
  end

  def sushi
    genre_shops = GenreShop.with_genres(2).map(&:shop_id)
    @images = Image.where(shop_id: genre_shops).square
  end

  def teishoku
  end

  def izakaya
  end
end
