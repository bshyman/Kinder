module KinderHelper
  def filter_by(hash, user_collection)
    filtered_results = user_collection
    hash.each_pair do |k,v|
      p "#{k} = #{v}"
      filtered_results = filtered_results.select do |user|
        user.attributes[k] == v
      end
    end
   filtered_results
  end
end