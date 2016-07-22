class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, foreign_key: :reviewer_id
  has_many :comments, foreign_key: :commenter_id
  has_many :hosting, foreign_key: :host_id, class_name: :Playdate
  has_many :attendees, foreign_key: :guest_id
  has_many :attending, through: :attendees, source: :playdate
  validates :username, presence: true, uniqueness: true

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

end
