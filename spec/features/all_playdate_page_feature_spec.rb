require 'rails_helper'

feature "View playdate feature" do
  scenario "see scheduled playdates" do
    user = User.create!(username:"amanda", password:"1234", email: "adnama.lin@gmail.com", zipcode:60614)
    playdate = Playdate.create!(time: Faker::Time.forward(23, :morning).to_s.match(/\d{2}:\d{2}:\d{2}/).to_s, title: "Brunch at Benjis", description: "Let's eat brunch and drink bloddy mary's while the kids play", location:"123 Main St. Chicago, Il", date:"2016-07-28" ,host_id: user.id)
    Attendee.create!(guest_id: user.id, playdate_id: playdate.id, response: true)
    visit '/login'
    fill_in('Username', :with => 'amanda')
    fill_in('Password', :with => '1234')
    click_button('Login')
    expect(page).to have_content "Brunch at Benjis"
  end

  scenario "click on a link to view all playdates" do
    user = User.create!(username:"amanda", password:"1234", email: "adnama.lin@gmail.com", zipcode:60614)
    visit '/login'
    fill_in('Username', :with => 'amanda')
    fill_in('Password', :with => '1234')
    click_button('Login')
    expect(find_link("See All Playdates").visible?).to eq true
  end

  scenario "see pending playdates" do
    user = User.create!(username:"amanda", password:"1234", email: "adnama.lin@gmail.com", zipcode:60614)
    user2 = User.create!(username:"benji", password:"1234", email: "bshyman@gmail.com", zipcode:60614)
    playdate = Playdate.create!(time: Faker::Time.forward(23, :morning).to_s.match(/\d{2}:\d{2}:\d{2}/).to_s, title: "beach Day!", description: "Picnic at the beach, bring your pets!", location:"Montrose Beach", date:"2016-08-27" ,host_id: user2.id)
    Attendee.create!(guest_id: user.id, playdate_id: playdate.id, response: nil)
    visit '/login'
    fill_in('Username', :with => 'amanda')
    fill_in('Password', :with => '1234')
    click_button('Login')
    within("div.pending-playdates > div.playdate-listing") do
      expect(page).to have_content "beach Day!"
    end
  end

  scenario "click on a link to view all playdates" do
    user = User.create!(username:"amanda", password:"1234", email: "adnama.lin@gmail.com", zipcode:60614)
    visit '/'
    fill_in('Username', :with => 'amanda')
    fill_in('Password', :with => '1234')
    click_button('Login')
    expect(find_link("See All Pending Playdates").visible?).to eq true
  end
end
