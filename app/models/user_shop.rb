class UserShop < ApplicationRecord
  belongs_to :user
  belongs_to :shop, counter_cache: :likes_count

  scope :rated, ->{where('rate != ?', 'nil')} #評価した店
end
