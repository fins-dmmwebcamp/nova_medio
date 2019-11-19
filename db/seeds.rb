# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Label.create!(
  [
    {
      name: 'テストレーベル',
    },
    {
      name: 'テスト2',
    },
     {
      name: 'テスト3',
    },{
      name: 'テストレーベル',
    },
    {
      name: 'テスト2',
    },
     {
      name: 'テスト3',
    },{
      name: 'テストレーベル',
    },
    {
      name: 'テスト2',
    },
     {
      name: 'テスト3',
    },{
      name: 'テストレーベル',
    },
    {
      name: 'テスト2',
    },
     {
      name: 'テスト3',
    }

  ]
)
if Rails.env == "development"
  15.times do |i|
    Artist.create!(name: "passworafad")
  end
end