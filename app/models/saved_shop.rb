class SavedShop < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :shop_genre
end
