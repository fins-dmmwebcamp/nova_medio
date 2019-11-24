class Label < ApplicationRecord
  has_many :products
 validates:name, presence:true,uniqueness: true
 def self.search(search)#このメソッドは検索タグに文字があるときに動き、その文字列をnameカラムから探します。文字が無いとallを出します。
      if search
        Label.where(['name LIKE ?', "%#{search}%"])if name.present?
     else
        Label.all
      end
    end
end
