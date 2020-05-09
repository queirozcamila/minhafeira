class Product < ApplicationRecord
  has_many :cart_products
  belongs_to :shop, optional: true
end
