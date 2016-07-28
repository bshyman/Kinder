require 'httparty'
require 'zipcodeapi'

class User < ActiveRecord::Base
  has_secure_password
  has_friendship
  mount_uploader :avatar, AvatarUploader

  has_many :hosting, foreign_key: :host_id, class_name: :Playdate, dependent: :destroy
  has_many :attendees, foreign_key: :guest_id, dependent: :destroy
  has_many :attending, through: :attendees, source: :playdate
  has_many :messages
  has_many :subscriptions
  has_many :chats, through: :subscriptions
  has_many :children, foreign_key: :parent_id, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  serialize :music
  validates :bio, length: {maximum: 300,
                  too_long: "must be limited to %{count} characters"}

  class << self
    def from_omniauth(auth_hash)
      user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
      if !user.persisted?
        user.first_name = auth_hash['info']['first_name']
        user.last_name = auth_hash['info']['last_name']
        user.username = auth_hash['info']['email']
        user.password = SecureRandom.hex
        user.email = auth_hash['info']['email']
        # user.avatar = {url: auth_hash['info']['image']}
        user.token = auth_hash['credentials']['token']
        user.refresh_token = auth_hash['credentials']['refresh_token']
        user.expires_in = auth_hash['credentials']['expires_at']
      end
      user
    end
  end

  def users_in_proximity
    # NEED TO UNCOMMENT FOR PRODUCTION TO HIT API
    # HOURLY LIMIT IS 50
     api = ZipcodeAPI.new
     nearby = api.get_nearby_zipcodes(self.zipcode, self.radius)
     users =  User.where("zipcode IN (?)", nearby.map(&:to_i))
    # users =  User.where(zipcode: self.zipcode)
    users.to_a
    users -= [self]
    users -= self.blocked_friends
    users -= self.pending_friends
    users -= self.friends
    users
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

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

  def accept_invite(playdate)
    @attendee = self.attendees.find_by(playdate_id: playdate.id)
    @attendee.update(response: true)
  end

  def decline_invite(playdate)
    @attendee = self.attendees.find_by(playdate_id: playdate.id)
    @attendee.update(response: false)
  end

  def pending_direct_add
    requests = self.friendships.where(direct_add: true, status: "requested")
    direct = []
    requests.each do |f|
      direct << User.find(f.friend_id)
    end
    direct
  end

  def find_unreads
    unseen = []
    self.chats.each do |c|
      c.messages.each do |m|
        if m.user_id != self.id
          if m.seen == false
            unseen << m
          end
        end
      end
    end
    unseen
  end


end
