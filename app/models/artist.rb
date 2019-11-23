class Artist < ApplicationRecord
  has_many :products
   validates:name, presence:true,uniqueness: true
 def self.search(search)
      if search
        Artist.where(['name LIKE ?', "%#{search}%"])if name.present?
     else
        Artist.all
      end
    end
end
