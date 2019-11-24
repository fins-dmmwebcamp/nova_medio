class Product < ApplicationRecord
  has_many :order_details
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :arrivals
  has_many :discs, dependent: :destroy, inverse_of: :product
  belongs_to :artist, optional: true
  belongs_to :label, optional: true
  belongs_to :genre, optional: true
  attachment :product_image
  accepts_nested_attributes_for :discs
end
