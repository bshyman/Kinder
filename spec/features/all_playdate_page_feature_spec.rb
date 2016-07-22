require 'rails_helper'

feature "view all the songs on the home page" do
  before(:each) { User.create!(username:"amanda", password:"1234", email: "adnama.lin@gmail.com")}
  before(:each) {Playdate.create!(title: "Brunch at Benjis", description: "Let's eat brunch and drink bloddy mary's while the kids play", location:"123 Main St. Chicago, Il", date:"2016-07-28" ,host_id: 1) }


  scenario "see scheduled playdates" do
    visit '/users/:id/playdates'
      expect(page).to have_content "July, 28th with Benji and Jax"
  end

  scenario "click on a link to view all playdates" do
    visit '/users/:id/playdates'
    find_link("See All Playdates").visible?
  end
end


