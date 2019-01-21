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

  scope :by_keyword, (lambda do |string|
    string.split(' ').inject(self) do |scope, text|
      query = ransack(genres_genre_name_or_shop_name_or_area_area_name_cont_any: text).result
      scope.merge(query)
    end
  end)


  # あとで消す
  has_many :user_shops, dependent: :destroy
  has_many :users, through: :user_shops
  accepts_nested_attributes_for :user_shops
  # ..
  scope :with_shops, ->(shop_id){ where(id: shop_id) }

  def rectangle_image
    images.rectangle.first.image.to_s
    # if Image.exists?
    # else
      # 'notfound.png', width: '360'
    # end
  end

  def square_image
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

  class << self
    def set_shop_rates
      self.all.each do |shop|
        shop.update(shop_rate: shop.rates.where.not(rate: nil).average(:rate))
      end
    end
  end
  # コンソールで実行
  # Shop.set_shop_rates
  def self.ransackable_scopes(auth_object = nil)
    %i[by_keyword]
  end
end
