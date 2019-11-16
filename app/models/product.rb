class Product < ApplicationRecord
  has_many :products
  has_many :order_details
  has_many :favorites
  has_many :cart_items
  has_many :arrivals
  has_many :discs
  belongs_to :artist
  belongs_to :label
  belongs_to :genre
  attachment :product_image
end
