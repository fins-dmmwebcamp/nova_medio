class Genre < ApplicationRecord
  has_many :products, foreign_key: "genre_id", :dependent => :nullify#genreを削除した場合、そのgenreに紐付くproductは削除しないようにしました
  validates:name, presence:true,uniqueness: true
 def self.search(search)#このメソッドは検索タグに文字があるときに動き、その文字列をnameカラムから探します。文字が無いとallを出します。
      if search
        Genre.where(['name LIKE ?', "%#{search}%"])if name.present?
     else
        Genre.all
      end
    end
end

