class Shop < ApplicationRecord
  has_many :favorites
  has_many :saved_shops
  has_many :browsing_histories
  validates :name, length: { maximum: 255 }
  validates :prefecture, length: { maximum: 10 }
  validates :city, length: { maximum: 255 }
  validates :address, length: { maximum: 255 }
  with_options presence: true do
    validates :name
    validates :prefecture
    validates :city
    validates :address
    validates :latitude
    validates :longitude
    validates :business_hour
    validates :cashless
  end
end
