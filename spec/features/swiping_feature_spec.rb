require 'rails_helper'

feature 'Swiping' do
  let! (:user) { User.create!(username:"vi", password: "1234", zipcode:60614) }
  let! (:user2) { User.create!(username:"aman", password: "1234", zipcode:60614) }

  before(:each) do
    user3 = User.create!(username:"benji", password:"1234", zipcode:60614)
    user.friend_request(user3)
    user3.accept_request(user)
    user.block_friend(user3)
    visit login_path
    fill_in('Username', :with => 'vi')
    fill_in('Password', :with => '1234')
    click_button('Login')
  end

  scenario 'going to kinder brings you to another user"s picture & survey' do
    visit kinders_path
    expect(page).to have_current_path kinder_path(user2.id)
  end

  scenario 'clicking on the left button rejects the user' do
    visit kinders_path
    expect(page).to have_current_path kinder_path(user2.id)
  end
end
