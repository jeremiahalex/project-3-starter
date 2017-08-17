# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Restaurant.create(name: "Macdonald's")
#
# Deal.create(name: "Free Ice-Cream", restaurant_id: 1)

# Group.create(pax: 10, time: 1300, date: 20170814)

#
# 5.times do |i|
#   User.create(name: "Tag##{i + 1}", email: "test#{i}@gmail.com",
#   password: "test123")
#

Restaurant.create(name: "Orchard Tower Cai Fan", latitude: 1.306972, longitude: 103.829044)
Restaurant.create(name: "Basilico Restaurant", latitude: 1.304622, longitude: 103.824855)
Restaurant.create(name: "Cold Storage @ Claymore", latitude: 1.307519, longitude: 103.829481)
Restaurant.create(name: "Waku Ghin", latitude:1.284119, longitude:103.859157)
Restaurant.create(name: "IPPUDO Tanjong Pagar", latitude:1.276724, longitude:103.846234)
Restaurant.create(name: "Ramen Champion (Clarke Quay Central)", latitude:1.289228, longitude:103.846236)
Restaurant.create(name: "PocoLoco Microbrewery", latitude:1.335010, longitude:103.735361)
Restaurant.create(name: "Tatsuya", latitude:1.308886, longitude:103.834463)
Restaurant.create(name: "Saboten", latitude:1.361620, longitude:103.989519)




Deal.create(name: "1 for 1 Cai Fan if meal is Above $5", description: "1 for 1 Cai Fan if meal is Above $5 all day", pax: 2, restaurant_id: 1)
Deal.create(name: "1 for 1 on all Mains Lunch Only", description: "1 for 1 on all Mains Lunch Only, between 12-2pm", pax: 2, restaurant_id: 2)
Deal.create(name: "Buy 3 Salads get 1 Pork Knuckle at 50% off", description: "Buy 3 Salads get 1 Pork Knuckle at 50% off. While Stocks Last", pax: 3, restaurant_id: 3)
Deal.create(name: "Buy 4 Roast Chicken Platters get two free Bratwurst Sausage", description: "Buy 4 Roast Chicken Platters get one free Bratwurst Sausage", pax: 4, restaurant_id: 3)
