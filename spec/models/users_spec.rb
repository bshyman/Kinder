describe User do
  let!(:user) { User.create!(username:"vi", password: "1234", zipcode:60614) }
  let!(:user2) { User.create!(username:"aman", password: "1234", zipcode:60614) }
  let!(:user3) { User.create!(username:"benji", password:"1234", zipcode:60614) }
  describe "Virtual Attributes" do
    it "shows users in the same zipcode who are not blocked" do
      user.friend_request(user3)
      user3.accept_request(user)
      user.block_friend(user3)
      expect(user.users_in_proximity).to eq [user2]
    end
  end
end
