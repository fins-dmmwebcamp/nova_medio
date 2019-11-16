class Product < ApplicationRecord
  has_many :order_details
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :arrivals
  has_many :discs, dependent: :destroy
  belongs_to :artist
  belongs_to :label
  belongs_to :genre
  attachment :product_image, dependent: :destroy
end