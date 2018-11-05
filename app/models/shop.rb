class Shop < ApplicationRecord
  belongs_to :area
  belongs_to :genre
  has_many :logs
end
