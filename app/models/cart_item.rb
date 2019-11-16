class CartItem < ApplicationRecord
  belongs_to :custoemr
  belongs_to :product
end
