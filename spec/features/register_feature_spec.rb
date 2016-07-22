require 'rails_helper'

feature 'Register feature' do
  scenario 'user clicks register link and sees registration' do
    visit '/'
    click_link "Register"
    expect(page).to have_content "Registration"
  end

  scenario 'user clicks register link and can create a new account' do
    visit '/'
    click_link "Register"
    fill_in('Username', :with => 'John')
    fill_in('Password', :with => 'password')
    fill_in('Password confirmation', :with => 'password')
    click_button "Register!"
    expect(page).to have_current_path root_path
  end
end
