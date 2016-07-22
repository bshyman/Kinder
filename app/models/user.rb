class User < ActiveRecord::Base
  has_secure_password
  has_friendship
  has_many :reviews, foreign_key: :reviewer_id
  has_many :comments, foreign_key: :commenter_id
  validates :username, presence: true, uniqueness: true

  def users_in_proximity
    users = User.where(zipcode: self.zipcode)
    users.to_a
    users -= [self]
    users -= self.blocked_friends
    users -= self.pending_friends
    users
  end

end
