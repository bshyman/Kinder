require 'rails_helper'

feature "user schedules a new playdate" do

  scenario "fill out form and get directed to invite people" do
    user = User.create!(username:"amanda", password:"1234", email: "adnama.lin@gmail.com")
    visit '/'
    click_link "Login"
    fill_in('Username', :with => 'amanda')
    fill_in('Password', :with => '1234')
    click_button('Login')
    save_and_open_page
    click_link("Schedule New Playdate")
    fill_in('Title', :with => 'Brunch at Benjis')
    fill_in('Description', :with => "Let's eat brunch and drink bloddy mary's while the kids play")
    fill_in('Date', :with => '2016-07-28')
    fill_in('Location', :with => '123 Main St. Chicago, Il')
    click_button('Create Playdate')
    expect(page).to have_content "Select Who to Invite:"
  end

  scenario "click on a link to view all playdates" do
    user = User.create!(username:"amanda", password:"1234", email: "adnama.lin@gmail.com")
    visit "/users/#{user.id}/playdates"
    find_link("See All Playdates").visible?
  end

end


