class Playdate < ActiveRecord::Base
  belongs_to :host, class_name: :User
  has_many :attendees
  has_many :guests, through: :attendees, source: :guest
end
