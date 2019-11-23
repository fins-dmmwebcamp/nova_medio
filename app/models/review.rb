class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  validates :title, presence: true
  validates :rank,presence: true
  validates :body, presence: true
end
