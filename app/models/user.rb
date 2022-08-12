class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :saved_shops, dependent: :destroy
  has_many :shops, through: :saved_shops
  has_many :browsing_histories, dependent: :destroy
  validates :name, length: { maximum: 255 }
  validates :email, length: { maximum: 255 }
  validates :password, length: { in: 6..255 }
  validates :admin, inclusion: [true, false]
  with_options presence: true do
    validates :name
    validates :email
  end
end
