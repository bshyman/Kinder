require 'rails_helper'

feature "view all the songs on the home page" do

  scenario "see scheduled playdates" do
    user = User.create!(username:"amanda", password:"1234", email: "adnama.lin@gmail.com")
    Playdate.create!(title: "Brunch at Benjis", description: "Let's eat brunch and drink bloddy mary's while the kids play", location:"123 Main St. Chicago, Il", date:"2016-07-28" ,host_id: user.id)
    visit "/users/#{user.id}/playdates"
    within(".playdate-listing") do
      expect(page).to have_content "July, 28th | Brunch at Benjis"
    end
  end

  scenario "click on a link to view all playdates" do
    user = User.create!(username:"amanda", password:"1234", email: "adnama.lin@gmail.com")
    visit "/users/#{user.id}/playdates"
    find_link("See All Playdates").visible?
  end
end


