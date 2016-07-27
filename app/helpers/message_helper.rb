module MessageHelper

  def find_unreads(user)
    unseen_count = []
    user.messages.each do |msg|
      unseen_count << msg.seen == false
    end
  end



end
