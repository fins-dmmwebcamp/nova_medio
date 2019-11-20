class Song < ApplicationRecord
  belongs_to :disc, inverse_of: :songs
end
