class Subscription < ActiveRecord::Base
  belongs_to :chats
  belongs_to :users
end
