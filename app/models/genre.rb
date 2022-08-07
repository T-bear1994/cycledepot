class Genre < ApplicationRecord
  has_many :shop_genres
  validates :name, length: { maximum: 255 }
  validates :name, presence: true
end
