module UserHelper

  def vaccinate?(user)
  	return "No" if user.vaccinate == nil
  	user.vaccinate ? "Yes" : "No"
  end


  def format_music_choices(user)
    user.music ?  user.music.join(", ") : "None"
  end

  def age(t)
  dob = self.date_of_birth
  months = (t.year * 12 + t.month) - (dob.year * 12 + dob.month)
  readable_age(months / 12, 15 % 12)
end
end
