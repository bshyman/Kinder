class Survey < ApplicationRecord
  belongs_to :user
  validates :bio, length: {maximum: 300,
                  too_long: "must be limited to %{count} characters"}
  validates :zipcode, presence: true
  validates :radius, presence: true
  validates :vaccinate, presence: true
  serialize :music
end
