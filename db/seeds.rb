# coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@mail.com',
  password: 'aaaaaa'
)

10.times do |no|
  Customer.create!(
    name_first: "山田#{no}",
    name_last: '太郎',
    name_first_kana: "ヤマダ#{no}",
    name_last_kana: 'タロウ',
    email: "mail#{no}@mail.com",
    password: 'aaaaaa',
    phone_number: '12345678901'
  )
end
10.times do |no|
  Artist.create!(
    name: "歌手#{no}"
  )
end
10.times do |no|
  Genre.create!(
    name: "ジャンル#{no}"
  )
end
10.times do |no|
  Label.create!(
    name: "レーベル#{no}"
  )
end

10.times do |no|  
  Product.create!(
    artist_id: no + 1,
    genre_id: no + 1,
    label_id: no + 1,
    name: "商品#{no}",
    price: no*1000,
    released_at: "2019-11-#{no+1}"
  )
end

10.times do |no|
  Arrival.create!(
    product_id: no + 1,
    amount: (no + 1) * 10 
  )
end
10.times do |no|
  CartItem.create!(
    product_id: no + 1,
    customer_id: 10 - no,
    amount: (no + 1) * 4
  )
end
10.times do |no|
  Destination.create!(
    customer_id: no + 1,
    name: 'ヤマダテツト',
    postal_code: '1234567',
    address_prefecture: no + 1,
    address_city: "渋谷区",
    address_after: "1-1-1"
  )
end
10.times do |no|
  Disc.create!(
    product_id: no / 3 + 1,
    order: no / 3 + 1, 
  )
end
10.times do |no|
  Favorite.create!(
    customer_id: 10 - no,
    product_id: no + 1,
  )
end
10.times do |no|
  Order.create!(
    customer_id: no + 1,
    shipping_status: 1,
    payment: 1,
    shipping_fee: 500,
    postal_code: '1234567',
    address: "東京都渋谷区1-1-#{no}",
    reciever: "さとうあああ"
  )
end
10.times do |no|
  OrdersDetail.create!(
    order_id: no + 1,
    product_id: no + 1,
    amount: (no + 1) * 2,
    price: (no + 1) * 100,
  )
end
10.times do |no|
  Review.create!(
    customer_id: 10 - no,
    product_id: no + 1,
    title: "あああ",
    rank: no % 5 + 1,
    body: 'ああああああああああああああああああああああああああああああああ',
  )
end
10.times do |no|
  Song.create!(
    disc_id: no / 3 + 1,
    order: no % 5 + 1,
    name: "歌#{no}" 
  )
end