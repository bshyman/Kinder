class Playdate < ActiveRecord::Base
  belongs_to :host, class_name: :User
  has_many :attendees, dependent: :destroy
  has_many :guests, through: :attendees, source: :guest

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true

  def attending_guests
    attending = self.attendees.accepted
    attending_guests = []
    attending.each do |a|
      attending_guests << User.find(a.guest_id)
    end
    attending_guests
  end

  def pending_guests
    attending = self.attendees.pending
    pending_guests = []
    attending.each do |a|
      pending_guests << User.find(a.guest_id)
    end
    pending_guests
  end

end
