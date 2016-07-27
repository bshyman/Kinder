class Child < ActiveRecord::Base
  belongs_to :parent, class_name: 'User'

  validates :name, presence: true
  validates :birthday, presence: true
end
