# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# product seed
# 3.times do
#   Product.create(
#     product_name: "hello"
#   )
# end
#
# space seed
# 50.times do |index|
#   new_space = Space.new
#
#   new_space.company_name = Faker::Company.name
#   new_space.address = Faker::Address.street_address
#   new_space.summary = Faker::Company.catch_phrase
#   new_space.description = Faker::Company.bs
#   new_space.contact = Faker::Company.australian_business_number
#   new_space.image_url = Faker::Company.logo
#   new_space.is_active = true
#   new_space.category_id = Random.new.rand(1..10)
#   new_space.user_id = 1
#   new_space.website_id = 1
#
#   new_space.save
# end
#
# category seed
category_array = ["Electronic", "Food & Beverage", "Jewelry & Watches", "Apparel & Accessories", "Furniture", "Handicraft", "Toys & Hobbies", "Home & Garden", "Gift", "Others"]
10.times.each do |index|
  new_category = Category.new
  new_category.category_type = category_array[index]
  new_category.save
end
