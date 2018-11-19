class Shop < ApplicationRecord
  belongs_to :area
  has_many :logs
  has_one :image
  has_many :menus
  has_many :user_shops
  has_many :users, through: :user_shops
  has_many :genre_shops
  has_many :genres, through: :genre_shops
  accepts_nested_attributes_for :user_shops
end
