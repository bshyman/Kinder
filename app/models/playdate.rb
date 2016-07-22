class Playdate < ActiveRecord::Base
  belongs_to :host, class_name: :User
  has_many :attendees
  has_many :guests, through: :attendees, source: :playdate

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true
end
