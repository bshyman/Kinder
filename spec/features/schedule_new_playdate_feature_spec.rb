require 'rails_helper'

feature "Schedule Playdate Feature" do
  let!(:user) { User.create!(username:"amanda", password:"1234", email: "adnama.lin@gmail.com", zipcode:60614) }
  let!(:user2) { User.create!(username:"kyri", password:"1234", email: "k@gmail.com", zipcode:60614) }
  before(:each) do
    visit '/login'
    fill_in('Username', :with => 'amanda')
    fill_in('Password', :with => '1234')
    click_button('Login')
  end

  scenario "without connections, there will not be a schedule playdate button" do
    visit '/'
    expect(page).to_not have_content "New Playdate"
  end

  scenario "with connections, the schedule playdate button is clickable" do
    user.friend_request(user2)
    user2.accept_request(user)
    visit '/'
    click_link('New Playdate')
    expect(page).to have_field "Title"
  end

  scenario "with connections, user can schedule a playdate" do
    user.friend_request(user2)
    user2.accept_request(user)
    visit '/'
    click_link('New Playdate')
    fill_in("Title", with: "Pool Party")
    fill_in("Description", with: "Come cool off with some swimming!")
    fill_in("Date", with: "09/01/2016")
    fill_in("Time", with: "01:00 PM")
    fill_in("Location", with: "public pool")
    click_button('Save')
    check("#{user2.id}")
    click_button('Invite')
    expect(page).to have_content "Pool Party"
  end

  scenario "invited user can accept invite" do

  end
end
