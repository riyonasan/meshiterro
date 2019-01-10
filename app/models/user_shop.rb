class UserShop < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  scope :rated, ->{where('rate != ?', 'nil')} #評価した店
end
