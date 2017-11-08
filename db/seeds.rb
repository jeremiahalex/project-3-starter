# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 5.times do
#   new_user = User.new
#   new_user.name = Faker::Hobbit.character
#   new_user.email = Faker::Internet.email
#   new_user.password = 'test123'
#
#   new_user.save
# end

4.times do |i|
  new_size = Size.new
  lower_bound = i*3
  upper_bound = i*3+3

  new_size.name = "#{lower_bound} - #{upper_bound} M"
  new_size.save
end
