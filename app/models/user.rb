class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, foreign_key: :reviewer_id
  has_many :comments, foreign_key: :commenter_id
  has_many :hostings, foreign_key: :host_id, class_name: :Playdate
  validates :username, presence: true, uniqueness: true

end
