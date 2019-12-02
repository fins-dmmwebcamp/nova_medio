class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  has_many :destinations

  accepts_nested_attributes_for :destinations,allow_destroy: true




  has_many :orders
  has_many :reviews
  has_many :favorites
  has_many :destinations
  has_many :cart_items, dependent: :destroy



# フルネームを定義


# def name_full
#   [name_first,name_last].join('')
# end

def already_liked?(product)
  self.likes.exists?(product_id: product.id)
end

def name_full
  "#{self.name_first} #{self.name_last}"
end

def name_full_kana
  "#{self.name_first_kana} #{self.name_last_kana}"
end


def self.search(search)
      if search
        Customer.where(['email LIKE ?', "%#{search}%"])
      else
        Customer.all
      end
    end

end
