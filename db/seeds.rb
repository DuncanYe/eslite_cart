# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




30.times do |i|
  price = [100, 200, 300].sample
  p = Product.create(
    name: FFaker::Product.product_name,
    original_price: price,
    sell_price: price - 10,
    state: Product.states.keys.sample,
    sku: rand(1...8)
  )
end