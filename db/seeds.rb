# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Therapist Name
10.times do |index|
  Therapist.create(
    name: Faker::Name.first_name
  )
end


# Service & Types
Service.create(
  service_type: 1,
  name: "Signature Massage",
  description: "A refreshing head and scalp massage including face acupressure and tension-releasing foot massage. Our specialty massage will leave your body rejuvenated from head to toe.",
  price: 180,
  slots_taken: 2,
  therapist_id: Therapist.find(1).id
)

Service.create(
  service_type: 2,
  name: "Deep Tissue Massage",
  description: "Slow, deep pressure massage targets on stressed and tired muscles to unlock tension and relieve pain. An ideal pre or post workout massage to reduce injuries or recover faster.",
  price: 140,
  slots_taken: 2,
  therapist_id: Therapist.find(2).id
)

Service.create(
  service_type: 3,
  name: "Time Saver Massage",
  description: "Gliding, kneading and pressure point movements concentrate on releasing tension in back, neck and shoulders. Ideal lunchtime stress relief or a quick stop on the way home from the office.",
  price: 60,
  slots_taken: 2,
  therapist_id: Therapist.find(3).id
)

Service.create(
  service_type: 4,
  name: "Gentleman's Shave & Facial",
  description: "A precision shave with essential oil infused towel and customised facial which cleanses, hydrates and tones to effectively condition and address environmental exposure. Warm stones ease tension in neck and shoulders while leaving your face smooth and refreshed.",
  price: 120,
  slots_taken: 2,
  therapist_id: Therapist.find(4).id
)

Service.create(
  service_type: 5,
  name: "Sensitive Skin Shave & Facial",
  description: "Redness and inflammation are calmed using soothing, naturally derived extracts without clogging pores to leave skin purified and hydrated. Restores  your skin and leaves it healthy.",
  price: 130,
  slots_taken: 2,
  therapist_id: Therapist.find(5).id
)


Service.create(
  service_type: 6,
  name: "Traditional Shave",
  description: "Skin is prepared with pre-shave oil and lathered with hot shaving cream. Traditional straight razor with precision and mastery then a cold towel infused with lavender essential oil, finish with after-shave balm to hydrate the freshly shaven skin.",
  price: 50,
  slots_taken: 2,
  therapist_id: Therapist.find(6).id
)

Service.create(
  service_type: 7,
  name: "Shampoo Blow Dry and Styling",
  description: "Signature shampoo and condition, including a relaxing scalp massage ensures the hair is clean healthy and protected. Finish off with a blow dry and styling to leave you ready to go for the day ahead.",
  price: 60,
  slots_taken: 2,
  therapist_id: Therapist.find(7).id
)

Service.create(
  service_type: 8,
  name: "Customised Scalp Treatment",
  description: "Invigorating scalp massage utilizing a blend of essential oils to cleanse and relieve dry, itchy scalp. Continue with a hot towel and finish with rosemary shampoo, conditioner and hair styling of your choice.",
  price: 80,
  slots_taken: 2,
  therapist_id: Therapist.find(8).id
)

Service.create(
  service_type: 9,
  name: "Therapeutic Mani-Pedicure",
  description: "Relieve tired hands and legs with bamboo granule exfoliation and a massage targeting muscle tension and stress. A moisturizer with natural essential oils is used to help promote circulation and healing.",
  price: 70,
  slots_taken: 2,
  therapist_id: Therapist.find(9).id
)

Service.create(
  service_type: 10,
  name: "Time Saver Manicure",
  description: "Nail shaping, buffing, cuticle detailing and complete with an application of botanical lotion. Ideal for those on the go.",
  price: 30,
  slots_taken: 2,
  therapist_id: Therapist.find(10).id
)
