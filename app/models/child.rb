class Child < ActiveRecord::Base
  belongs_to :parent, class_name: 'User'

  validates_presence_of :name, :parent_id
end
