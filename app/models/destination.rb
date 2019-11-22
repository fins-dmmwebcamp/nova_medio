class Destination < ApplicationRecord
  belongs_to :customer

  def address_full
  "#{self.address_prefecture} #{self.address_city} #{self.address_after} }"
  end


end
