class Category < ApplicationRecord
  # アソシエーション
  has_many :items

  # バリデーション
  validates :name, presence: true
end
