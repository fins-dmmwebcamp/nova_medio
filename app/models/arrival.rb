class Arrival < ApplicationRecord
  belongs_to :product
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :product_id, presence: true
end
