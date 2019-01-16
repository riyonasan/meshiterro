class Shop < ApplicationRecord
  belongs_to :area
  has_many :logs
  has_many :images
  has_many :menus
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :rates, dependent: :destroy
  has_many :users, through: :rates
  has_many :genre_shops
  has_many :genres, through: :genre_shops
  accepts_nested_attributes_for :likes
  accepts_nested_attributes_for :rates

  # あとで消す
  has_many :user_shops, dependent: :destroy
  has_many :users, through: :user_shops
  accepts_nested_attributes_for :user_shops
  # ..


  def rectangle_image
    images.rectangle.first.image.to_s
  end

  def square_image
    images.square.first.image.to_s
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def set_shop_rates
    Shop.all.each do |shop|
      shop.update(shop_rate: shop.rates.where.not(rate: nil).average(:rate))
    end
  end
  # コンソールで実行
  # a = Shop.new
  # a.set_shop_rates
end
