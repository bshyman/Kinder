require 'rails_helper'

describe KindersController do
  let! (:user) { User.create!(username:"vi", password: "1234", zipcode:60614, email:"vi@g.com") }
  let! (:user2) { User.create!(username:"aman", password: "1234", zipcode:60614, email:"amanda.g.com") }
  let (:session) { {user_id: user.id} }

  it "has a method that can reject user" do
    get :reject_user, {id: user2.id}, session
    expect(user.blocked_friends).to eq [user2]
  end

  it "has a method that can accept user" do
    get :accept_user, {id: user2.id}, session
    expect(user.pending_friends).to eq [user2]
  end

  it "has a method that can reset kinders" do
    get :reset_kinders, session
    expect(user.blocked_friends).to eq []
  end
end
