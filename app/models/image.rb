class Image < ApplicationRecord
  belongs_to :shop
  mount_uploader :image, ImageUploader
end
