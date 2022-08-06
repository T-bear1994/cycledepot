class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites
  has_many :saved_shops
  has_many :browsing_histories
  validates :name, length: { maximum: 255 }
  validates :email, length: { maximum: 255 }
  validates :password, length: { in: 6..255 }
  with_options presence: true do
    validates :name
    validates :email
    validates :admin
  end
end
