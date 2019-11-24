class Disc < ApplicationRecord
  belongs_to :product, inverse_of: :discs
  has_many :songs, dependent: :destroy, inverse_of: :disc
  accepts_nested_attributes_for :songs, allow_destroy: true
end
