require 'rails_helper'

feature 'Swiping feature' do
  let! (:user) { User.create!(username:"vi", password: "1234", zipcode:60614, email:"vi@g.com") }
  let! (:user2) { User.create!(username:"aman", password: "1234", zipcode:60614, email:"a.g.com") }

  before(:each) do
    visit login_path
    fill_in('Username', :with => 'vi')
    fill_in('Password', :with => '1234')
    click_button('Login')
  end

  scenario 'going to kinder brings you to another user"s picture & survey' do
    visit kinders_path
    expect(page).to have_current_path kinder_path(user2.id)
  end

  scenario 'clicking a button goes to another user' do
    visit kinders_path
    user4 = User.create!(username:"leleand", password:"1234", zipcode:60614, email:"l@g.com")
    click_link "left"
    expect(page).to have_current_path kinder_path(user4.id)
  end

  scenario 'The end page is shown when you have gone through all possible kinders' do
    visit kinders_path
    click_link "left"
    expect(page).to have_content ("You have reached the end of possible kinders within your preferences.")
  end

  scenario 'You can reset kinders and start over' do
    visit kinders_path
    click_link "left"
    click_link "Click here"
    expect(page).to have_current_path kinder_path(user2.id)
  end
end
