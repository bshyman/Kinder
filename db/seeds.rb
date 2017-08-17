# user1 = User.create!(
# 	zipcode: 43201,
# 	username:"adnamalin",
# 	email: "adnama.lin@devbootcamp.com",
# 	password:"1234",
# 	vaccinate: true,
# 	religion: 'faithful',
# 	parenting_style: "Figure It Out As We Go",
# 	date_night: "Turn Up At The Club",
# 	first_name: "Amanda",
# 	last_name: "Lin",
# 	marital_status: 'single',
# 	bio: "Noming all day",
# 	radius: 10,
# 	gender: "Female")

user2 = User.create!(
	zipcode: "60614",
	radius: 10,
	username:"bshy",
	email: "bshyman@dbc.com",
	password:"password",
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

# user3 = User.create!(first_name: "Vivien",
# 	zipcode: 43201,
# 	radius: 10,
# 	last_name: "Kuo",
# 	username:"vi",
# 	password:"1234",
# 	email: "vi@gmail.com",
# 	vaccinate: true,
# 	gender: "female")

# user4 = User.create!(first_name: "Leland",
# 	zipcode: 43201,
# 	radius: 10,
# 	last_name: "Meiners",
# 	username:"leland",
# 	password:"1234",
# 	email: "leland@gmail.com",
# 	vaccinate: true,
# 	gender: "Male")

# user5 = User.create!(first_name: "Test",
# 	zipcode: 43201,
# 	radius: 10,
# 	last_name: "Zip",
# 	username:"test_zip",
# 	password:"1234",
# 	email: "test@gmail.com",
# 	vaccinate: true,
# 	gender: "Female")

# Playdate.create!(time: Faker::Time.forward(23, :morning).to_s.match(/\d{2}:\d{2}:\d{2}/).to_s, title: "Brunch at Benjis", description: "Let's eat brunch and drink bloddy mary's while the kids play", location:"Batter and berries", date:"2016-08-01" ,host_id: 2)
# Playdate.create!(time: Faker::Time.forward(23, :morning).to_s.match(/\d{2}:\d{2}:\d{2}/).to_s, title: "Bubble tea with the kiddos", description: "Get dem bubbles", location:"Kung Fu Tea Chinatown", date:"2016-07-29" ,host_id: 1)
# Playdate.create!(time: Faker::Time.forward(23, :morning).to_s.match(/\d{2}:\d{2}:\d{2}/).to_s, title: "Beach Day!", description: "Picnic at the beach, bring your pets!", location:"Montrose Beach", date:"2016-08-27" ,host_id: 2)

# duke = User.create!(
# 	zipcode: 60654,
# 	radius: 10,
# 	username: "gemdropper",
# 	email: "duke@devbootcamp.com",
# 	password:"1234",
# 	vaccinate: true,
# 	religion: "Music is my savior",
# 	parenting_style: "I Do What My Mom Tells Me To",
# 	date_night: "Frozen Pizza And Blaze One",
# 	shopping_prefs: "Target",
# 	fav_activities: "Writing rhymes and headphone zonin'",
# 	music: ['Hip Hop', "R&B and Soul" ],
# 	bio: "I got jokes bro",
# 	gender: "Male",
# 	first_name: "Duke",
# 	last_name: "Greene",
# 	marital_status: 'married'
# 	)

# matt = User.create!(
# 	zipcode: 60654,
# 	radius: 10,
# 	username: "therealmattbaker",
# 	email: "matt@devbootcamp.com",
# 	password:"1234",
# 	vaccinate: true,
# 	religion: "Pastafarian",
# 	parenting_style: "Whatever The Kardashians Are Doing",
# 	date_night: "Turn Up At The Club",
# 	shopping_prefs: "I Make My Own Clothes",
# 	fav_activities: "Tree hugging and branch debugging",
# 	music: ["Classical and Jazz", "Metal and Hardcore" ],
# 	bio: "",
# 	gender: "Male",
# 	first_name: "Matt",
# 	last_name: "Baker",
# 	marital_status: 'single'
# 	)

# alyssa = User.create!(
# 	zipcode: 60654,
# 	radius: 10,
# 	username: "deerlist",
# 	email: "alyssa@devbootcamp.com",
# 	password:"1234",
# 	vaccinate: true,
# 	religion: "Scientology",
# 	parenting_style: "I Do What My Mom Tells Me To",
# 	date_night: "Dive Bar And Shitty Garage Band",
# 	shopping_prefs: "Thrift It!",
# 	fav_activities: " ",
# 	music: ["Classical and Jazz", "Metal and Hardcore" ],
# 	bio: "Nobody ever taught me how to properly eat a burger",
# 	gender: "Female",
# 	first_name: "Alyssa",
# 	last_name: "Diaz",
# 	marital_status: 'single'
# 	)

# mike = User.create!(
# 	zipcode: 60654,
# 	radius: 10,
# 	username: "bikeliker",
# 	email: "mike@devbootcamp.com",
# 	password:"1234",
# 	vaccinate: true,
# 	religion: "Hail Buckeye",
# 	parenting_style: "Carefully Research Everything",
# 	date_night: "Can't Go Out, We Have Kids",
# 	shopping_prefs: "Carter's",
# 	fav_activities: "Howling at the moon",
# 	music: ["House and Techno", "Gospel" ],
# 	bio: "I slam on the keyboard when recording videos",
# 	gender: "Male",
# 	first_name: "Mike",
# 	last_name: "Busch",
# 	marital_status: 'married'
# 	)

# ellie = User.create!(
# 	zipcode: 60654,
# 	radius: 10,
# 	username: "elliealsolikesbikes",
# 	email: "ellie@devbootcamp.com",
# 	password:"1234",
# 	vaccinate: true,
# 	parenting_style: "Figure It Out As We Go",
# 	date_night: "Turn Up At The Club",
# 	music: ["Ambient Drone Synth"],
# 	first_name: "Ellie",
# 	last_name: "Poley",
# 	marital_status: 'married'
# 	)

# avner = User.create!(
# 	zipcode: 60654,
# 	radius: 10,
# 	username: "bitsandatoms",
# 	email: "avner@devbootcamp.com",
# 	password:"1234",
# 	vaccinate: true,
# 	parenting_style: "Figure It Out As We Go",
# 	date_night: "Frozen Pizza And Blaze One",
# 	music: ["Metal and Hardcore", "Disney Radio"],
# 	bio: "I'm interested in how people relate to technology",
# 	first_name: "Avner",
# 	last_name: "Shanan",
# 	marital_status: 'single'
# 	)


# matt.children.create!(name: "Guccifer", allergies: "Stupidity, smelly code, laziness, inferior password encryption", birthday: "2014-04-20")
# matt.children.create!(name: "Bakerbaby", allergies: "Shrimp, salt", birthday: "2015-04-20")

# user2.children.create!(name: "Jackson", allergies:"None", birthday:"2014-09-28")

religion_options = ["Jewish", "Chrsitian", "Catholic", "Muslim", "Atheist", "Agnostic", "Hindu", "Buddhist", "Prefer not to disclose"]
marriage_status_options = ['single', 'married', 'divorced', 'widowed','dating', 'polyamorous']
parenting_style_options = ["Figure It Out As We Go", "Carefully Research Everything", "Whatever The Kardashians Are Doing", "I Do What My Mom Tells Me To", "Some Of This, Some Of That"]
date_night_options = ["Turn Up At The Club",
"Romantic Dinner And Drama Movie", "Hotdogs And Horror Movie", "Frozen Pizza And Blaze One", "Dive Bar And Shitty Garage Band", "Can't Go Out, We Have Kids", "Netflix And Chill"]
shopping_prefs_options = ["Jack And Jill", "Carter's", "Walmart", "I Make My Own Clothes", "Target", "Thrift It!"]
@music_options = ["Hip Hop", "R&B and Soul", "Jam Bands", "House and Techno", "Classical and Jazz", "Ambient Drone Synth", "Metal and Hardcore", "Pop Country", "Disney Radio", "Gospel", "Classic Rock", "Indie Rock", "Ska and Punk"]

def random_music
	music_selections = []
	2.times{|genre| music_selections << @music_options.sample}
	music_selections
end

def zipcode_formatter
	suffix = Faker::Number.between(01, 66).to_s
	suffix.prepend("0") if suffix.length == 1
	"606" + suffix
end

100.times do |i|
	User.create!(
	zipcode: zipcode_formatter,
	radius: [1, 5, 10, 15, 20, 25, 50].sample,
	username: Faker::Internet.user_name + "#{i}",
	email: Faker::Internet.email,
	password: Faker::Internet.password(8, 20),
	vaccinate: Faker::Boolean.boolean(0.8),
	religion: religion_options.sample,
	parenting_style: parenting_style_options.sample,
	date_night: date_night_options.sample,
	shopping_prefs: shopping_prefs_options.sample,
	fav_activities: Faker::Superhero.power,
	music: random_music,
	bio: "My favorite book is " + Faker::Book.title + " written by " + Faker::Book.author,
	gender: "Robot",
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	marital_status: marriage_status_options.sample,
	avatar: Faker::Avatar.image(Faker::Number.number(10), '50x50')
	)
end

300.times do |i|
	Playdate.create!(
		title: Faker::Hacker.adjective,
		description: Faker::Hipster.sentence,
		location: "Chicago, IL",
		host_id: 1 + rand(99),
		date: Faker::Time.forward(23, :all),
		time: Faker::Time.forward(23, :all) 
	)

end




