module KinderHelper
  def filter_by(hash, user_collection)
    filtered_results = user_collection
    if hash
      hash.each_pair do |k,v|
        filtered_results = filtered_results.select do |user|
          user.attributes[k] == v
        end
      end
    end
   filtered_results
  end

  def current_controller?(names)
    names.include?(params[:controller]) unless params[:controller].blank? || false
  end

  def avatar_url
    if @user.avatar?
      @user.avatar.url
    else
      asset_path "kinder-icon-circle.png"
    end
  end
end
