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

# Restaurant.create(name: "Orchard Tower Cai Fan", latitude: 1.306972, longitude: 103.829044)
# Restaurant.create(name: "Basilico Restaurant", latitude: 1.304622, longitude: 103.824855)
# Restaurant.create(name: "Cold Storage @ Claymore", latitude: 1.307519, longitude: 103.829481)

Restaurant.create(name: "Waku Ghin", latitude:1.284119, longitude:103.859157)
Restaurant.create(name: "IPPUDO", latitude:1.276724, longitude:103.846234)
Restaurant.create(name: "Ramen Champion", latitude:1.289228, longitude:103.846236)
Restaurant.create(name: "PocoLoco Brewery", latitude:1.335010, longitude:103.735361)
Restaurant.create(name: "Tatsuya", latitude:1.308886, longitude:103.834463)
Restaurant.create(name: "Saboten", latitude:1.361620, longitude:103.989519)

Restaurant.create(name: "Cut", latitude:1.285252, longitude:103.859580)
Restaurant.create(name: "Skirt", latitude:1.246191, longitude:103.842230)
Restaurant.create(name: "Prata Wala", latitude:1.339084, longitude:103.706219)
Restaurant.create(name: "Grub", latitude:1.364908, longitude:103.835823)
Restaurant.create(name: "Swensen's", latitude:1.380015, longitude:103.764360)
Restaurant.create(name: "Ramen Keisuke", latitude:1.318872, longitude:103.892899)












# Deal.create(name: "1 for 1 Cai Fan if meal is Above $5", description: "1 for 1 Cai Fan if meal is Above $5 all day", pax: 2, restaurant_id: 1)
# Deal.create(name: "1 for 1 on all Mains Lunch Only", description: "1 for 1 on all Mains Lunch Only, between 12-2pm", pax: 2, restaurant_id: 2)
# Deal.create(name: "Buy 3 Salads get 1 Pork Knuckle at 50% off", description: "Buy 3 Salads get 1 Pork Knuckle at 50% off. While Stocks Last", pax: 3, restaurant_id: 3)
# Deal.create(name: "Buy 4 Roast Chicken Platters get two free Bratwurst Sausage", description: "Buy 4 Roast Chicken Platters get one free Bratwurst Sausage", pax: 4, restaurant_id: 3)
Deal.create(name: "3rd Set Lunch free with every 2 ordered!", description: "3rd set lunch is free with every 2 set lunches ordered! This place is a paradise for sashimi and chirashi lovers where you can enjoy fresh seafood in a cosy Japanese-style setting! Terms and Conditions: Reservations must be made through Group Shen website and this promotion must be selected. This offer is valid from 5 July to 31 August. This offer is valid daily for lunch, including weekends and Public Holidays. This offer is not valid in conjunction with other ongoing promotions and offers. Minimum of 3 pax to book. The management reserves the right to change terms and conditions without prior notice.", pax: 3, restaurant_id: 1)
Deal.create(name: "1 Dines Free with Every 3 Paying Guests!", description: "Lunch
12pm - 2.30pm | Mon - Sat
Adult: $58++
Child: $29++
Brunch
12pm - 3pm | Sun
Adult: $108++
Child: $54++
Dinner
6pm - 10pm | Mon - Sun
Adult: $78++
Child: $39++
Terms and Conditions: Reservations must be made through Group Shen website and this promotion must be selected. This offer is only valid for lunch, dinner and Sunday brunch. This offer is not valid with other promotions, discounts and vouchers.
This offer is only valid for full buffet option. This promotion is not valid on the eve and on public holidays. The management reserves the right to change terms and conditions without prior notice.
", pax: 4, restaurant_id: 2)
Deal.create(name: "Sunday Salad Day ", description: "Groups of 4 enjoy complimentary free flow salad bar with every regular main course order when you make your reservations through Group Shen. Terms and Conditions: Reservations must be made through Group Shen website and this promotion must be selected. Valid at Ramen Champion Clarke Quay Central outlet only. Valid for DINE-IN on Sundays only. Valid with any regular priced main course order. Not valid in conjunction with other ongoing promotions, set meals, top up specials, discounts or voucher privileges. Promotion Period: 3 Sep - 31 Dec 2017", pax: 4, restaurant_id: 3)
Deal.create(name: "Drinks from $6++ throughout the day", description: "Happy Hour is now a thing of the past: Groups of 6 enjoy special drinks prices throughout the day from 11:00am to Midnight with PocoLoco's brand new Premium House Wines and Draught Beer pricing! Terms & Conditions: Reservations must be made through Group Shen and this deal must be selected. Deal valid from Monday to Saturday from 11am till 12am. PocoLoco is closed on Sundays. Cannot be used in conjunction with other promotions, discounts or vouchers. Prices are subjected to 7% GST and 10% service charge. The management reserves the right to amend the terms and conditions without prior notice.", pax: 6, restaurant_id: 4)
Deal.create(name: "2nd main course at 50% off", description: "Enjoy 2nd main course at 50% off! Terms and Conditions: Reservations must be made through Group Shen and this deal must be selected. Deal is only valid for dinner from Sunday - Thursday. Deal is valid from 19 August to 30 September 2017. Deal is not applicable for use during Public Holidays or Eve of Public Holidays. Deal is not applicable with other promotions, discounts, offers or vouchers. The management reserves the right to amend the terms & conditions as necessary.", pax: 2, restaurant_id: 5)
Deal.create(name: "25% Off Lunch Buffet With Every 4 Adults
", description: "Saboten Japanese Restaurant will be having a 25% off Lunch Buffet promotion daily. You will receive 25% off lunch buffet with every 4 adults.
", pax: 4, restaurant_id: 6)
