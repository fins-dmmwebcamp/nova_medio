class Artist < ApplicationRecord
  has_many :products,  foreign_key: "artist_id", :dependent => :nullify
   validates:name, presence:true,uniqueness: true
 def self.search(search)#このメソッドは検索タグに文字があるときに動き、その文字列をnameカラムから探します。文字が無いとallを出します。
      if search
        Artist.where(['name LIKE ?', "%#{search}%"])if name.present?
     else
        Artist.all
      end
    end
end
