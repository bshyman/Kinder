module UserHelper

  def vaccinate?(user)
    user.vaccinate ? 'Yes' : 'No'
  end

  def format_music_choices(user)
    user.music ?  user.music.join(", ") : "None"
  end

end


