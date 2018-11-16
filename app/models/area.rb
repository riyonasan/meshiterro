class Area < ApplicationRecord
  has_many :areas, class_name: 'Area', foreign_key: 'area_id'
  belongs_to :area, class_name: 'Area'
  has_many :shops
end
