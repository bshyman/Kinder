require 'rails_helper'

feature "view all the songs on the home page" do

  scenario "see scheduled playdates" do
    user = User.create!(username:"amanda", password:"1234", email: "adnama.lin@gmail.com")
    playdate = Playdate.create!(title: "Brunch at Benjis", description: "Let's eat brunch and drink bloddy mary's while the kids play", location:"123 Main St. Chicago, Il", date:"2016-07-28" ,host_id: user.id)
    Attendee.create!(guest_id: user.id, playdate_id: playdate.id, response: true)
    visit "/users/#{user.id}/playdates"
    within("div.scheduled-playdates > div.playdate-listing") do
      expect(page).to have_content "July, 28th | Brunch at Benjis"
    end
  end

  scenario "click on a link to view all playdates" do
    user = User.create!(username:"amanda", password:"1234", email: "adnama.lin@gmail.com")
    visit "/users/#{user.id}/playdates"
    find_link("See All Playdates").visible?
  end

  scenario "see pending playdates" do
    user = User.create!(username:"amanda", password:"1234", email: "adnama.lin@gmail.com")
    user2 = User.create!(username:"benji", password:"1234", email: "bshyman@gmail.com")
    playdate = Playdate.create!(title: "beach Day!", description: "Picnic at the beach, bring your pets!", location:"Montrose Beach", date:"2016-08-27" ,host_id: user2.id)
    Attendee.create!(guest_id: user.id, playdate_id: playdate.id, response: nil)
    visit "/users/#{user.id}/playdates"
    within("div.pending-playdates > div.playdate-listing") do
      expect(page).to have_content "August, 27th | beach Day!"
    end
  end

  scenario "click on a link to view all playdates" do
    user = User.create!(username:"amanda", password:"1234", email: "adnama.lin@gmail.com")
    visit "/users/#{user.id}/playdates"
    find_link("See All Pending Playdates").visible?
  end
end


