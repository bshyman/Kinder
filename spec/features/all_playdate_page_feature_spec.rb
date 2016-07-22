require 'rails_helper'

feature "view all the songs on the home page" do
  before(:each) { User.create!(username:"vi", password:"1234", email: "vi@gmail.com")}
  before(:each) { User.create!(username:"vi", password:"1234", email: "vi@gmail.com") Playdate.create!(title: "Parting", artist: "Boris") }


  scenario "see scheduled playdates" do
    visit '/users/:id/playdates'
      expect(page).to have_content "July, 28th with Benji and Jax"
  end

  scenario "user can go to the homepage, click log in, and enter credentials" do
    visit '/'
    click_link "login"
    fill_in('Username', :with => 'vi')
    fill_in('Password', :with => '1234')
    click_button('login')
    expect(page).to have_content "vi"
  end
end

feature "Can click" do
  before(:each) { User.create!(username:"vi", password:"1234", email: "vi@gmail.com") }

  scenario "user can go to the homepage, click log in, and enter credentials" do
    visit '/'
    click_link "login"
    fill_in('Username', :with => 'vi')
    fill_in('Password', :with => '1234')
    click_button('login')
    expect(page).to have_content "vi"
  end
end
