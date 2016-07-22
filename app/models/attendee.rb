class Attendee < ActiveRecord::Base
  belongs_to :guest, foreign_key: :guest_id ,class_name: :User
  belongs_to :playdate
  scope :pending, -> {where(response: nil)}
  scope :accepted, -> {where(response: true)}
end
