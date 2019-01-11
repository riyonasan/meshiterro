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


  def index_rectangle_image
    images.rectangle.first.image.to_s
  end

  def genre_square_image
    images.square.first.image.to_s
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def self.search(search)
    if search
      Shop.where(['content LIKE ?', "%#{search}"])
    else
      Shop.all
    end
  end

end
