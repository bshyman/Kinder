require 'rails_helper'

feature 'Kinder feature' do
  let! (:user) { User.create!(username:"vi", password: "1234", zipcode: 60614, gender: "Female", email:"vi@g.com") }
  let! (:user2) { User.create!(username:"aman", password: "1234", zipcode: 60614, gender: "Female", email:"a.g.com") }

  before(:each) do
    visit login_path
    fill_in('Username', :with => 'vi')
    fill_in('Password', :with => '1234')
    click_button('Login')
  end

  context 'Pass and connect mimic swipes' do
    scenario 'going to kinder brings you to another user"s picture & survey' do
      visit kinders_path
      expect(page).to have_current_path kinder_path(user2.id)
    end

    scenario 'clicking a button goes to another user' do
      visit kinders_path
      user4 = User.create!(username:"leleand", password:"1234", zipcode:60614, email:"l@g.com")
      click_link "Pass"
      expect(page).to have_current_path kinder_path(user4.id)
    end

    scenario 'two users connecting with each other will bring user to user profile' do
      user2.friend_request(user)
      visit kinders_path
      click_link "Connect"
      expect(page).to have_content "You've made a connection! Click on the 'Schedule Playdate' button to set up a playdate or 'Send Message' to discuss your preferred times and locations."
    end
  end

  context 'there is an end of kinders and a reset option' do
    scenario 'The end page is shown when you have gone through all possible kinders' do
      visit kinders_path
      click_link "Pass"
      expect(page).to have_content ("You have reached the end of possible kinders within your preferences.")
    end

    scenario 'You can reset kinders and start over' do
      visit kinders_path
      click_link "Pass"
      click_link "Click here"
      expect(page).to have_current_path kinder_path(user2.id)
    end
  end

  context 'User can filter kinders' do
    scenario 'You can filter with gender' do
      User.create!(username:"Benji", first_name:"Benji", password: "1234", zipcode: 60614, gender: "Male", vaccinate: true, email:"b@g.com")
      visit kinders_path
      within('.modal-content') do
        select('Male', from: 'gender')
        click_button('Filter Results')
      end
      expect(page).to have_content("Benji Gender: Male Vaccinate: Yes")
    end
  end
end
