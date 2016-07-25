require 'rails_helper'

feature "Login feature" do
  before(:each) { User.create!(username:"vi", password:"12345678", zipcode:60614, email:"wut@gmail.com") }

  scenario 'user clicks login link and sees login' do
    visit '/login'
    expect(page).to have_content "Login"
  end

  scenario "user can go to the homepage, click log in, and enter credentials" do
    visit '/login'
    fill_in('Username', :with => 'vi')
    fill_in('Password', :with => '12345678')
    click_button('Login')
    expect(page).to have_content "Dashboard"
  end

   scenario "user can go to the homepage, click logout" do
    visit '/login'
    fill_in('Username', :with => 'vi')
    fill_in('Password', :with => '12345678')
    click_button('Login')
    within("#slide-out") do
      click_link "Logout"
    end
    expect(page).to have_link 'Register'
  end
end
