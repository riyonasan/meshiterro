class UserShop < ApplicationRecord
  belongs_to :user

  scope :rated, ->{where('rate != ?', 'nil')} #評価した店

  belongs_to :shop, counter_cache: :likes_count
end
