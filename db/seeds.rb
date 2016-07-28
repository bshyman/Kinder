# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(
	zipcode: 60616,
	username:"adnamalin",
	email: "adnama.lin@devbootcamp.com",
	password:"1234",
	vaccinate: true,
	religion: 'faithful',
	parenting_style: "Figure It Out As We Go",
	date_night: "Turn Up At The Club",
	first_name: "Amanda",
	last_name: "Lin",
	marital_status: 'single',
	bio: "I'm smart",
	radius: 10,
	gender: "Female")

user2 = User.create!(
	zipcode: 60614,
	username:"bshy",
	email: "bshyman@devbootcamp.com",
	password:"1234",
	vaccinate: true,
	religion: "I'm bad at it",
	parenting_style: "Some Of This, Some Of That",
	date_night: "Hotdogs And Horror Movie",
	shopping_prefs: "Walmart",
	fav_activities: 'Gallavanting, Pitboarding',
	music: ['Hip Hop', "Ska and Punk" ],
	bio: "I don't roll on shabbos",
	gender: "Male",
	first_name: "Benji",
	last_name: "Shyman",
	marital_status: 'married'
	)

user3 = User.create!(first_name: "Vivien",
	last_name: "Kuo",
	username:"vi",
	password:"1234",
	email: "vi@gmail.com",
	zipcode: 60616,
	radius: 10,
	vaccinate: true,
	gender: "female")

user4 = User.create!(first_name: "Leland",
	last_name: "Meiners",
	username:"leland",
	password:"1234",
	email: "leland@gmail.com",
	zipcode: 60616,
	radius: 10,
	vaccinate: true,
	gender: "Male")

user5 = User.create!(first_name: "Test",
	last_name: "Zip",
	username:"test_zip",
	password:"1234",
	email: "test@gmail.com",
	zipcode: 60616,
	radius: 10,
	vaccinate: true,
	gender: "Female")

user1.friend_request(user2)
user1.friend_request(user3)
user1.friend_request(user4)
user1.friend_request(user5)
user2.accept_request(user1)
user3.accept_request(user1)
user4.accept_request(user1)
user5.accept_request(user1)

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

5.times { User.create!(username:Faker::Internet.user_name, email: "b@g.com", password:"1234", zipcode: 60614, gender:"Male", vaccinate:true, first_name:Faker::Name.first_name) }
5.times { User.create!(username:Faker::Internet.user_name, email: "b@g.com", password:"1234", zipcode: 60614, gender:"Male", vaccinate:false, first_name:Faker::Name.first_name) }

duke = User.create(
	zipcode: 60614,
	username: "gemdropper",
	email: "duke@devbootcamp.com",
	password:"1234",
	vaccinate: true,
	religion: "Music is my savior",
	parenting_style: "I Do What My Mom Tells Me To",
	date_night: "Frozen Pizza And Blaze One",
	shopping_prefs: "Target",
	fav_activities: "Writing rhymes and headphone zonin'",
	music: ['Hip Hop', "R&B and Soul" ],
	bio: "I got jokes bro",
	gender: "Male",
	first_name: "Duke",
	last_name: "Greene",
	marital_status: 'married'
	)

matt = User.create(
	zipcode: 60614,
	username: "therealmattbaker",
	email: "matt@devbootcamp.com",
	password:"1234",
	vaccinate: true,
	religion: "Pastafarian",
	parenting_style: "Whatever The Kardashians Are Doing",
	date_night: "Turn Up At The Club",
	shopping_prefs: "I Make My Own Clothes",
	fav_activities: "Tree hugging and branch debugging",
	music: ["Classical and Jazz", "Metal and Hardcore" ],
	bio: "",
	gender: "Male",
	first_name: "Matt",
	last_name: "Baker",
	marital_status: 'single'
	)

alyssa = User.create(
	zipcode: 60614,
	username: "deerlist",
	email: "alyssa@devbootcamp.com",
	password:"1234",
	vaccinate: true,
	religion: "Scientology",
	parenting_style: "I Do What My Mom Tells Me To",
	date_night: "Dive Bar And Shitty Garage Band",
	shopping_prefs: "Thrift It!",
	fav_activities: " ",
	music: ["Classical and Jazz", "Metal and Hardcore" ],
	bio: "Nobody ever taught me how to properly eat a burger",
	gender: "Female",
	first_name: "Alyssa",
	last_name: "Diaz",
	marital_status: 'single'
	)

mike = User.create(
	zipcode: 60614,
	username: "bikeliker",
	email: "mike@devbootcamp.com",
	password:"1234",
	vaccinate: true,
	religion: "Hail Buckeye",
	parenting_style: "Carefully Research Everything",
	date_night: "Can't Go Out, We Have Kids",
	shopping_prefs: "Carter's",
	fav_activities: "Howling at the moon",
	music: ["House and Techno", "Gospel" ],
	bio: "I slam on the keyboard when recording videos",
	gender: "Male",
	first_name: "Mike",
	last_name: "Busch",
	marital_status: 'married'
	)































