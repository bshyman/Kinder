module UserHelper

  def vaccinate?(user)
  	return "No" if user.vaccinate == nil
  	user.vaccinate ? "Yes" : "No"
  end


  def format_music_choices(user)
    user.music ?  user.music.join(", ") : "None"
  end

end
