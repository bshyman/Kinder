# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username:"amanda", password:"1234", email: "adnama.lin@gmail.com", zipcode: 60616, radius: 10)
User.create!(username:"benji", password:"1234", email: "bshyman@gmail.com", zipcode: 60616, radius: 5)
User.create!(username:"vi", password:"1234", email: "vi@gmail.com", zipcode: 60616, radius: 1)
User.create!(username:"leland", password:"1234", email: "leland@gmail.com", zipcode: 60616, radius: 10)
User.create!(username:"test_zip", password:"1234", email: "test@gmail.com", zipcode: 60607, radius: 10)

Playdate.create!(time: Faker::Time.forward(23, :morning).to_s.match(/\d{2}:\d{2}:\d{2}/).to_s, title: "Brunch at Benjis", description: "Let's eat brunch and drink bloddy mary's while the kids play", location:"123 Main St. Chicago, Il", date:"2016-07-28" ,host_id: 2)
Playdate.create!(time: Faker::Time.forward(23, :morning).to_s.match(/\d{2}:\d{2}:\d{2}/).to_s, title: "Bubble tea with the kiddos", description: "Get dem bubbles", location:"Kung Fu Tea", date:"2016-07-27" ,host_id: 1)
Playdate.create!(time: Faker::Time.forward(23, :morning).to_s.match(/\d{2}:\d{2}:\d{2}/).to_s, title: "beach Day!", description: "Picnic at the beach, bring your pets!", location:"Montrose Beach", date:"2016-08-27" ,host_id: 2)

5.times {
  Playdate.create!(time: Faker::Time.forward(23, :morning).to_s.match(/\d{2}:\d{2}:\d{2}/).to_s,
    date:Faker::Time.backward(23),
    location:"#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state_abbr}",
    description: Faker::Hipster.paragraph,
    title: Faker::Hipster.sentence,
    host_id: Faker::Number.between(1, 4))
}

Attendee.create!(guest_id:1, playdate_id: 1, response: true)
Attendee.create!(guest_id:2, playdate_id: 2, response: true)
Attendee.create!(guest_id:1, playdate_id: 3, response: nil)
