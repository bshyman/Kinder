require 'rails_helper'

describe KinderHelper do
  let(:user) { User.create!(username:"benji", email: "b@g.com", password:"1234", zipcode: 60614, gender:"Male", vaccinate:"true") }
  it "has a method that returns filtered users" do
    true_users = []
    false_users = []
    5.times { true_users << User.create!(username:Faker::Internet.user_name, email: "b@g.com", password:"1234", zipcode: 60614, gender:"Male", vaccinate:true, first_name:Faker::Name.first_name) }
    5.times { false_users << User.create!(username:Faker::Internet.user_name, email: "b@g.com", password:"1234", zipcode: 60614, gender:"Male", vaccinate:false, first_name:Faker::Name.first_name) }
    kinders = true_users + false_users
    expect(filter_by({"gender" => "Male","vaccinate" => true},kinders)).to eq true_users
  end
end
