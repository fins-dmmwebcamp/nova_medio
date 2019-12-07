class Product < ApplicationRecord
  has_many :orders_details
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :arrivals
  has_many :discs, dependent: :destroy, inverse_of: :product
  belongs_to :artist, optional: true
  belongs_to :label, optional: true
  belongs_to :genre, optional: true
  attachment :product_image
  accepts_nested_attributes_for :discs, allow_destroy: true

  # default_scope -> { order(id: :desc) }
  def self.search(search)
    if search
      Product.where(['name LIKE ?', "%#{search}%"])if name.present?
    else
      Product.all
    end
  end
end
