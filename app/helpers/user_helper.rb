module UserHelper

  def vaccinate?(user)
  	return "No" if user.vaccinate == nil
  	user.vaccinate ? "Yes" : "No"
  end


  def format_music_choices(user)
    user.music ?  user.music.join(", ") : "None"
  end

  def age(child)
    dob = child.birthday
    if dob != nil
      now = Date.current
      had_birthday = ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? true : false)
      years = now.year - dob.year - (had_birthday ? 0 : 1)
      months = had_birthday ? now.month - dob.month : 12 - (now.month - dob.month)
      if years == 0
        return months > 1 ? months.to_s + " months old" : months.to_s + " month old"
      elsif years == 1
        return months > 1 ? years.to_s + " year and " + months.to_s + " months old" : years.to_s + " year and " + months.to_s + " month old"
      else
        return months > 1 ? years.to_s + " years and " + months.to_s + " months old" : years.to_s + " years and " + months.to_s + " month old"
      end
    else
      return "No Date of Birth"
    end
  end
end
