require 'httparty'
require 'zipcodeapi'

class User < ActiveRecord::Base
  has_secure_password
  has_friendship
  has_many :reviews, foreign_key: :reviewer_id
  # wtf is comments?
  has_many :comments, foreign_key: :commenter_id
  has_many :hosting, foreign_key: :host_id, class_name: :Playdate, dependent: :destroy
  has_many :attendees, foreign_key: :guest_id, dependent: :destroy
  has_many :attending, through: :attendees, source: :playdate
  has_many :messages
  has_many :chats, through: :messages
  has_many :children, foreign_key: :parent_id, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  serialize :music

  def users_in_proximity
    api = ZipcodeAPI.new
    nearby = api.get_nearby_zipcodes(self.zipcode, self.radius)
    users =  User.where("zipcode IN (?)", nearby.map(&:to_i))
    users.to_a
    users -= [self]
    users -= self.blocked_friends
    users -= self.pending_friends
    users -= self.friends
    users
  end

  # def nearby_zipcodes
  #   api = ZipcodeAPI.new
  #   nearby = api.get_nearby_zipcodes(self.zipcode, 10)
  # end

  def all_playdates
    all_playdates = self.attending_playdates + self.hosting
  end

  def attending_playdates
    attending = self.attendees.accepted
    attending_playdates = []
    attending.each do |a|
      attending_playdates << Playdate.find(a.playdate_id)
    end
    attending_playdates
  end

  def pending_playdates
    pending = self.attendees.pending
    pending_playdates = []
    pending.each do |a|
      pending_playdates << Playdate.find(a.playdate_id)
    end
    pending_playdates
  end

  def create_invite(guest_id, playdate_id)
    Attendee.new(guest_id: guest_id, playdate_id: playdate_id, response: nil)
  end

  def accept_invite(playdate)
    @attendee = self.attendees.find_by(playdate_id: playdate.id)
    @attendee.update(response: true)
  end

  def decline_invite(playdate)
    @attendee = self.attendees.find_by(playdate_id: playdate.id)
    @attendee.update(response: false)
  end

  def pending_direct_add
    requests = self.friendships.where(direct_add: true, status: "pending")
    direct = []
    requests.each do |f|
      direct << User.find(f.friend_id)
    end
    direct
  end

end
