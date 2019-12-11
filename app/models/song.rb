class Song < ApplicationRecord
  belongs_to :disc, inverse_of: :songs
  validates :order, presence: true, numericality: { only_integer: true }
  validates :name, presence: true
end
