class Product < ApplicationRecord
  has_many :cart_products
  belongs_to :shop, optional: true
  has_one_attached :photo
end
