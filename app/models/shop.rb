class Shop < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :user
  has_one_attached :photo
end
