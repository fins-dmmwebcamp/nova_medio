class Product < ApplicationRecord
  has_many :orders_details
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :arrivals
  has_many :discs, dependent: :destroy, inverse_of: :product
  belongs_to :artist, optional: true
  belongs_to :label, optional: true
  belongs_to :genre, optional: true
  attachment :product_image
  accepts_nested_attributes_for :discs, allow_destroy: true
  validates :stock, numericality: { greater_than_or_equal_to: 0 }
  validates :artist_id, presence: true
  validates :genre_id, presence: true
  validates :label_id, presence: true
  validates :name, presence: true, length: { in: 1..50 }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :released_at, presence: true

  # default_scope -> { order(id: :desc) }
  def self.search(search)
    if search
      Product.where(['name LIKE ?', "%#{search}%"])
    else
      Product.all
    end
  end

  # 下の3つ、記述が少し違うのは、どっちでもできるよって意味です。

  def self.artist_search(search)
    if search
      @artist = Artist.where(['name LIKE ?', "%#{search}%"])
      @artist.each do |artist|
        # return artist.products
        return Product.where(artist_id: artist.id)
      end
    end
  end

  def self.genre_search(search)
    if search
      @genre = Genre.where(['name LIKE ?', "%#{search}%"])
      @genre.each do |genre|
        return genre.products
        # return Product.where(genre_id: genre.id)
      end
    end
  end

  def self.label_search(search)
    if search
      @label = Label.where(['name LIKE ?', "%#{search}%"])
      @label.each do |label|
        return label.products
        # return Product.where(label_id: label.id)
      end
    end
  end

end
