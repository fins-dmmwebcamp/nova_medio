class Order < ApplicationRecord
  has_many :orders_details, dependent: :destroy
  belongs_to :customer
  accepts_nested_attributes_for :orders_details

  enum shipping_status: {準備中: 0, 配達中: 1, 配達済み: 2}
  enum payment: {銀行振込: 0, クレジットカード: 1, 代引き: 2}
end
