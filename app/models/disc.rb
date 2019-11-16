class Disc < ApplicationRecord
  belongs_to :product
  has_many :songs, dependent: :destroy
end
