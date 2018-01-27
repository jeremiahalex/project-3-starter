# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




# 3.times do
#   Product.create(
#     product_name: "hello"
#   )
# end
#
10.times do |index|
  new_space = Space.new

  new_space.company_name = Faker::Company.name
  new_space.address = Faker::Address.street_address
  new_space.summary = Faker::Company.catch_phrase
  new_space.description = Faker::Company.bs
  new_space.contact = Faker::Company.australian_business_number
  # new_space.image_url = Faker::Company.logo
  new_space.image_url = "/uploads/space/image_url/13/logo-placeholder.jpg"
  new_space.is_active = false
  new_space.category_id = Random.new.rand(1..10)
  new_space.user_id = 1
  new_space.website_id = 7

  new_space.save
end

# 10.times do
#   new_category = Category.new
#
#   new_category.category_type = Faker::Commerce.department
#
#   new_category.save
# end
