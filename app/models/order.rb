class Order < ApplicationRecord
  has_many :orders_details, dependent: :destroy
  belongs_to :customer

  enum shipping_status:{準備中: 0, 配達中: 1, 配達済み: 2}
end
