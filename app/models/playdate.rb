class Playdate < ActiveRecord::Base
  belongs_to :host, class_name: :User
  has_many :attendees, dependent: :destroy
  has_many :guests, through: :attendees, source: :guest

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true
end
