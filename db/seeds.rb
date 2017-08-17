# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


1.times do |i|
  User.create(
    email: "leesinshingbrian@gmail.com",
    password: "test123",
    password_confirmation: "test123"
  )
end

5.times do |i|
  Event.create(
    name: "New Event #{i}",
    user_id: 1
  )
end

5.times do |i|
  Item.create(
    name: "New Items #{i}"
  )

end
