class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  # 1人が１つの投稿に対して、１つしかいいねをつけられない

  validates_uniqueness_of :product_id, scope: :customer_id
end
