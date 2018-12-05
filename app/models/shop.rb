class Shop < ApplicationRecord
  belongs_to :area
  has_many :logs
  has_many :images
  has_many :menus
  has_many :user_shops, dependent: :destroy
  has_many :users, through: :user_shops
  has_many :genre_shops
  has_many :genres, through: :genre_shops
  accepts_nested_attributes_for :user_shops
end
