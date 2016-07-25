require 'rails_helper'

feature 'Profile feature' do
  let! (:user) { User.create!(username:"vi", first_name:"Vivien", last_name:"Kuo", password: "1234", zipcode: 60614, email:"vi@g.com") }
  let! (:user2) { User.create!(username:"aman", first_name: "Amanda", last_name: "Lin", password: "1234", zipcode: 60614, email:"a.g.com") }

  before(:each) do
    user.friend_request(user2)
    user2.accept_request(user)
    visit login_path
    fill_in('Username', :with => 'vi')
    fill_in('Password', :with => '1234')
    click_button('Login')
  end

  scenario "User can see another user's profile" do
    visit user_path(user2.id)
    expect(page).to have_content ("Amanda Lin!");
  end

  scenario "User cannot edit another person's profile" do
    visit edit_user_path(user2.id)
    expect(page).to have_current_path no_access_path;
  end

  scenario "User can see own profile" do
    visit user_path(user.id)
    expect(page).to have_content ("Welcome Vivien Kuo!");
  end

  scenario "User cannot see a profile if not logged in" do
    visit '/'
    within("#slide-out") do
      click_link "Logout"
    end
    visit user_path(user.id)
    expect(page).to have_current_path no_access_path;
  end

  xscenario "User can edit user's own profile" do
    visit user_path(user.id)
    click_link 'Edit Profile'
    fill_in('Zipcode', with: 60614)
    click_button('Save')
    expect(page).to have_content "Zipcode: 60614"
  end
end
