# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(username:"amanda", password:"1234", email: "adnama.lin@gmail.com")

User.create!(username:"benji", password:"1234", email: "bshyman@gmail.com")

Playdate.create!(title: "Brunch at Benjis", description: "Let's eat brunch and drink bloddy mary's while the kids play", location:"123 Main St. Chicago, Il", date:"2016-07-28" ,host_id: 2)

Playdate.create!(title: "Bubble tea with the kiddos", description: "Get dem bubbles", location:"Kung Fu Tea", date:"2016-07-27" ,host_id: 1)

Playdate.create!(title: "beach Day!", description: "Picnic at the beach, bring your pets!", location:"Montrose Beach", date:"2016-08-27" ,host_id: 2)

Attendee.create!(guest_id:1, playdate_id: 1, response: true)
Attendee.create!(guest_id:2, playdate_id: 2, response: true)
Attendee.create!(guest_id:1, playdate_id: 3, response: nil)

